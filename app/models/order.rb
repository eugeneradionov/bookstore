class Order < ApplicationRecord
  has_one :delivery
  has_one :shipping_address
  has_one :billing_address
  has_one :user
  has_one :payment
  has_many :order_items
end
