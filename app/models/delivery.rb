class Delivery < ApplicationRecord
  has_many :orders
  validates :method, :days_from, :days_to, :price, presence: true

  rails_admin do
    object_label_method :method
  end
end
