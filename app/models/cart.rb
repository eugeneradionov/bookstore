class Cart < ApplicationRecord
  has_many :order_items, dependent: :destroy

  def add_book(book_id)
    current_item = order_items.find_by(book_id: book_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = order_items.build(book_id: book_id)
    end
    current_item
  end

  def total_price
    order_items.to_a.sum(&:subtotal_price)
  end

  def cart_size
    order_items.count
  end
end
