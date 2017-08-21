module OrdersHelper
  def order_shipping_full_name
    "#{@shipping_a.first_name} #{@shipping_a.last_name}"
  end

  def order_shipping_address
    @shipping_a.address
  end

  def order_shipping_city_zip
    "#{@shipping_a.city} #{@shipping_a.zip}"
  end

  def order_shipping_country
    country_name(@shipping_a.country)
  end

  def order_shipping_phone
    "Phone #{@shipping_a.phone}"
  end

  def order_billing_full_name
    "#{@billing_a.first_name} #{@billing_a.last_name}"
  end

  def order_billing_address
    @billing_a.address
  end

  def order_billing_city_zip
    "#{@billing_a.city} #{@billing_a.zip}"
  end

  def order_billing_country
    country_name(@billing_a.country)
  end

  def order_billing_phone
    "Phone #{@billing_a.phone}"
  end

  def order_delivery_method
    @delivery.method
  end

  def order_delivery_days
    "#{@delivery.days_from} to #{@delivery.days_to} days"
  end

  def order_delivery_price
    number_to_euro(@delivery.price)
  end

  def order_card_number
    last_four = @payment.card_number.split(//).last(4).join
    "**** **** **** #{last_four}"
  end

  def order_mm_yy
    @payment.mm_yy
  end
end
