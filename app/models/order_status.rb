class OrderStatus < ApplicationRecord
  has_many :orders

  validates_presence_of :status

  rails_admin do
    object_label_method :status
  end
end
