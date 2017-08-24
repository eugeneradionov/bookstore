class Order < ApplicationRecord
  belongs_to :delivery
  belongs_to :shipping_address
  belongs_to :billing_address
  belongs_to :user
  belongs_to :payment
  belongs_to :order_status
  has_many :order_items

  scope :in_delivery, -> { where(order_status: OrderStatus.find_by(status: 'In Delivery')) }
  scope :delivered, -> { where(order_status: OrderStatus.find_by(status: 'Delivered')) }
  scope :waiting_for_processing, -> { where(order_status: OrderStatus.find_by(status: 'Waiting for Processing')) }
  scope :in_progress, -> { where(order_status: OrderStatus.find_by(status: 'In Progress')) }

  def order_total
    discount_amount = discount || 0
    order_items.to_a.sum(&:subtotal_price) - discount_amount
  end

  def order_total_with_delivery
    delivery_price = delivery.price
    order_total + delivery_price
  end

  def order_items_total
    order_items.to_a.sum(&:subtotal_price)
  end

  def status
    order_status.status
  end
end
