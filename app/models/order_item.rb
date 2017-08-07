class OrderItem < ApplicationRecord
  belongs_to :book
  belongs_to :cart

  def subtotal_price
    book.price * quantity
  end
end
