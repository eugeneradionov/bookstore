class UserInfo < ApplicationRecord
  belongs_to :shipping_address # , dependent: :destroy
  belongs_to :billing_address # , dependent: :destroy
  belongs_to :payment # , dependent: :destroy
  belongs_to :user
end
