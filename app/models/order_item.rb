class OrderItem < ApplicationRecord
  belongs_to :book
  belongs_to :cart
  belongs_to :order, optional: true

  validates_presence_of :quantity

  def subtotal_price
    book.price * quantity
  end
end
