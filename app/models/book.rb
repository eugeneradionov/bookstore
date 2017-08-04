class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :image_urls
  validates :title, uniqueness: true
  validates :title, :description, :publication_year,
            :height, :width, :depth, presence: true

  paginates_per 12
end
