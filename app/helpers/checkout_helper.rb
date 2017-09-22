module CheckoutHelper
  def complete_step_full_name
    "#{@shipping_a.first_name} #{@shipping_a.last_name}"
  end

  def complete_step_address
    @shipping_a.address
  end

  def complete_step_city_zip
    "#{@shipping_a.city} #{@shipping_a.zip}"
  end

  def complete_step_country
    country_name(@shipping_a.country)
  end

  def complete_step_phone
    @shipping_a.phone
  end

  def checkout_shipping_full_name
    "#{@shipping_a.first_name} #{@shipping_a.last_name}"
  end

  def checkout_shipping_first_name
    @shipping_a.first_name
  end

  def checkout_shipping_last_name
    @shipping_a.last_name
  end

  def checkout_shipping_address
    @shipping_a.address
  end

  def checkout_shipping_city_zip
    "#{@shipping_a.city} #{@shipping_a.zip}"
  end

  def checkout_shipping_city
    @shipping_a.city
  end

  def checkout_shipping_zip
    @shipping_a.zip
  end

  def checkout_shipping_country
    @shipping_a.country
  end

  def checkout_shipping_phone
    @shipping_a.phone
  end
  def checkout_billing_full_name
    "#{@billing_a.first_name} #{@billing_a.last_name}"
  end

  def checkout_billing_first_name
    @billing_a.first_name
  end

  def checkout_billing_last_name
    @billing_a.last_name
  end

  def checkout_billing_address
    @billing_a.address
  end

  def checkout_billing_city_zip
    "#{@billing_a.city} #{@billing_a.zip}"
  end

  def checkout_billing_city
    @billing_a.city
  end

  def checkout_billing_zip
    @billing_a.zip
  end

  def checkout_billing_country
    @billing_a.country
  end

  def checkout_billing_phone
    @billing_a.phone
  end

  def card_number(payment)
    last_four = payment.card_number.split(//).last(4).join
    "**** **** **** #{last_four}"
  end

  def mm_yy(payment)
    # session[:checkout_params]['mm_yy']
    payment.mm_yy
  end

  def delivery_days(delivery)
    "#{delivery.days_from} to #{delivery.days_to} days"
  end

  def delivery_price(delivery)
    delivery.price.zero? ? 'Free' : number_to_euro(delivery.price)
  end
end
