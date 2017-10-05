class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :image_urls
  has_many :order_items
  has_many :reviews

  mount_uploader :cover_url, ImageUrlUploader

  before_destroy :ensure_no_order_items

  validates :title, uniqueness: true
  validates :title, :description, :publication_year,
            :height, :width, :depth, presence: true

  paginates_per 12

  def self.bestsellers
    books_orders_count = OrderItem.where('order_id IS NOT NULL').group(:book_id)
                             .order('sum("order_items"."quantity") DESC')
                             .limit(4).count

    bestsellers = []
    books_orders_count.each_key do |key|
      bestsellers << Book.find(key)
    end
    bestsellers
  end

  def self.categories_and_count
    sql = 'SELECT c.name, count(b.id)
    FROM books as b
    INNER JOIN books_categories as bc
    ON b.id = bc.book_id
    INNER JOIN categories as c
    ON c.id = bc.category_id
    GROUP BY c.id'
    ActiveRecord::Base.connection.execute(sql)
  end

  def ensure_no_order_items
    if order_items.empty?
      return true
    else
      errors.add(:base, 'There are exist order items')
      return false
    end
  end
end
