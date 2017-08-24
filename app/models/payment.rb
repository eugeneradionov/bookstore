class Payment < ApplicationRecord
  has_many :orders

  rails_admin do
    object_label_method :card_number
  end
end
