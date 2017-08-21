class Order < ApplicationRecord
  has_one :delivery
  has_one :shipping_address
  has_one :billing_address
  has_one :user
  has_one :payment
  has_one :order_status
  has_many :order_items

  def order_total
    discount_amount = discount || 0
    order_items.to_a.sum(&:subtotal_price) - discount_amount
  end

  def order_total_with_delivery
    delivery_price = Delivery.find(delivery_id).price
    order_total + delivery_price
  end

  def order_items_total
    order_items.to_a.sum(&:subtotal_price)
  end

  def status
    OrderStatus.find(order_statuses_id).status
  end
end
