class ImageUrl < ApplicationRecord
  mount_uploader :url, ImageUrlUploader
  has_and_belongs_to_many :books
  validates_presence_of :url
end
