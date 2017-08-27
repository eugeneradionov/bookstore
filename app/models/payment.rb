class Payment < ApplicationRecord
  has_many :orders

  validates :card_number, :mm_yy, :cvv, presence: true

  rails_admin do
    object_label_method :card_number
  end
end
