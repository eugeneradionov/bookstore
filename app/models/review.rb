class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  belongs_to :review_status
  validates_presence_of :title, :text
  validates :title, length: { maximum: 80 }
  validates :text, length: { maximum: 500 }
  validates :rating, inclusion: { in: 0..5,
                                  message: 'is not in 0-5' }

  scope :approved, -> { where(review_status: ReviewStatus.find_by(status: 'Approved')) }
  scope :unprocessed, -> { where(review_status: ReviewStatus.find_by(status: 'Unprocessed')) }
  scope :rejected, -> { where(review_status: ReviewStatus.find_by(status: 'Rejected')) }
end
