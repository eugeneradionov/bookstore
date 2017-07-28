class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  validates :title, uniqueness: true
  validates :title, :description, :publication_year,
            :height, :width, :depth, presence: true

  paginates_per 4 # TODO: change to 12 before deploy
end
