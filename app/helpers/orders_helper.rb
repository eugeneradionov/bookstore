module OrdersHelper
  def order_shipping_full_name
    "#{@order.shipping_address.first_name} #{@order.shipping_address.last_name}"
  end

  def order_shipping_address
    @order.shipping_address.address
  end

  def order_shipping_city_zip
    "#{@order.shipping_address.city} #{@order.shipping_address.zip}"
  end

  def order_shipping_country
    country_name(@order.shipping_address.country)
  end

  def order_shipping_phone
    "Phone #{@order.shipping_address.phone}"
  end

  def order_billing_full_name
    "#{@order.billing_address.first_name} #{@order.billing_address.last_name}"
  end

  def order_billing_address
    @order.billing_address.address
  end

  def order_billing_city_zip
    "#{@order.billing_address.city} #{@order.billing_address.zip}"
  end

  def order_billing_country
    country_name(@order.billing_address.country)
  end

  def order_billing_phone
    "Phone #{@order.billing_address.phone}"
  end

  def order_delivery_method
    @order.delivery.method
  end

  def order_delivery_days
    "#{@order.delivery.days_from} to #{@order.delivery.days_to} days"
  end

  def order_delivery_price
    number_to_euro(@order.delivery.price)
  end

  def order_card_number
    last_four = @order.payment.card_number.split(//).last(4).join
    "**** **** **** #{last_four}"
  end

  def order_mm_yy
    @order.payment.mm_yy
  end

  def order_id(order)
    order.id.to_s.rjust(9, '0').rjust(10, 'R')
  end
end
