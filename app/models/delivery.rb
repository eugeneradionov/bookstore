class Delivery < ApplicationRecord
  validates :method, :days_from, :days_to, :price, presence: true
end
