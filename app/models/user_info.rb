class UserInfo < ApplicationRecord
  belongs_to :shipping_address # , dependent: :destroy
  belongs_to :billing_address # , dependent: :destroy
  belongs_to :payment, optional: true # , dependent: :destroy
  belongs_to :user
end
