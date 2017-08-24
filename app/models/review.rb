class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  belongs_to :review_status
  validates_presence_of :title, :text

  scope :approved, -> { where(review_status: ReviewStatus.find_by(status: 'Approved')) }
  scope :unprocessed, -> { where(review_status: ReviewStatus.find_by(status: 'Unprocessed')) }
  scope :rejected, -> { where(review_status: ReviewStatus.find_by(status: 'Rejected')) }
end
