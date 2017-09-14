class UserInfo < ApplicationRecord
  belongs_to :shipping_address, optional: true # , dependent: :destroy
  belongs_to :billing_address, optional: true # , dependent: :destroy
  belongs_to :payment, optional: true # , dependent: :destroy
  belongs_to :user
end
