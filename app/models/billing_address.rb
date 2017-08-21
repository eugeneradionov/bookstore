class BillingAddress < ApplicationRecord
  has_many :orders
end
