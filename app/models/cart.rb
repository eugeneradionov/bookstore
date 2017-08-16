class Cart < ApplicationRecord
  has_many :order_items, dependent: :destroy

  def add_book(book_id, quantity = 1)
    current_item = order_items.find_by(book_id: book_id)
    if current_item
      current_item.quantity += quantity.to_i
    else
      current_item = order_items.build(book_id: book_id, quantity: quantity)
    end
    current_item
  end

  def total_price
    order_items.to_a.sum(&:subtotal_price)
  end

  def order_total
    total_price - get_discount
  end

  def cart_size
    order_items.count
  end

  def get_discount
    discount ? discount : 0
  end

  def empty?
    cart_size.zero?
  end
end
