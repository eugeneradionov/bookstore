class OrderItem < ApplicationRecord
  belongs_to :book
  belongs_to :cart

  validates_presence_of :quantity

  def subtotal_price
    book.price * quantity
  end
end
