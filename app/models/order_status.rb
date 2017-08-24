class OrderStatus < ApplicationRecord
  has_many :orders

  rails_admin do
    object_label_method :status
  end
end
