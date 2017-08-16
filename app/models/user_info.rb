class UserInfo < ApplicationRecord
  has_one :shipping_address
  has_one :billing_address
  has_one :payment
  belongs_to :user
end
