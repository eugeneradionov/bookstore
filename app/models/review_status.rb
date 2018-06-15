class ReviewStatus < ApplicationRecord
  has_many :reviews

  validates_presence_of :status

  rails_admin do
    object_label_method :status
  end
end
