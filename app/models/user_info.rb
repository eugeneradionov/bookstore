class UserInfo < ApplicationRecord
  has_one :shipping_address # , dependent: :destroy
  has_one :billing_address # , dependent: :destroy
  has_one :payment # , dependent: :destroy
  belongs_to :user
end
