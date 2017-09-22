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

  def ensure_no_order_items
    if order_items.empty?
      return true
    else
      errors.add(:base, 'There are exist order items')
      return false
    end
  end
end
