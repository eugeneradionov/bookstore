module CheckoutHelper
  def complete_step_full_name
    "#{@shipping_address.first_name} #{@shipping_address.last_name}"
  end

  def complete_step_address
    @shipping_address.address
  end

  def complete_step_city_zip
    "#{@shipping_address.city} #{@shipping_address.zip}"
  end

  def complete_step_country
    country_name(@shipping_address.country)
  end

  def complete_step_phone
    @shipping_address.phone
  end

  def checkout_shipping_full_name
    "#{session[:checkout_params]['shipping_first_name']} #{session[:checkout_params]['shipping_last_name']}"
  end

  def checkout_shipping_first_name
    session[:checkout_params]['shipping_first_name'] || @shipping_a.first_name
  end

  def checkout_shipping_last_name
    session[:checkout_params]['shipping_last_name'] || @shipping_a.last_name
  end

  def checkout_shipping_address
    session[:checkout_params]['shipping_address'] || @shipping_a.address
  end

  def checkout_shipping_city_zip
    "#{session[:checkout_params]['shipping_city']} #{session[:checkout_params]['shipping_zip']}"
  end

  def checkout_shipping_city
    session[:checkout_params]['shipping_city'] || @shipping_a.city
  end

  def checkout_shipping_zip
    session[:checkout_params]['shipping_zip'] || @shipping_a.zip
  end

  def checkout_shipping_country
    session[:checkout_params]['shipping_country'] || @shipping_a.country
  end

  def checkout_shipping_phone
    session[:checkout_params]['shipping_phone'] || @shipping_a.phone
  end

  def checkout_billing_full_name
    "#{session[:checkout_params]['billing_first_name']} #{session[:checkout_params]['billing_last_name']}"
  end

  def checkout_billing_first_name
    session[:checkout_params]['billing_first_name'] || @billing_a.first_name
  end

  def checkout_billing_last_name
    session[:checkout_params]['billing_last_name'] || @billing_a.last_name
  end

  def checkout_billing_address
    session[:checkout_params]['billing_address'] || @billing_a.address
  end

  def checkout_billing_city_zip
    "#{session[:checkout_params]['billing_city']} #{session[:checkout_params]['billing_zip']}"
  end

  def checkout_billing_city
    session[:checkout_params]['billing_city'] || @billing_a.city
  end

  def checkout_billing_zip
    session[:checkout_params]['billing_zip'] || @billing_a.zip
  end

  def checkout_billing_country
    session[:checkout_params]['billing_country'] || @billing_a.country
  end

  def checkout_billing_phone
    session[:checkout_params]['billing_phone'] || @billing_a.phone
  end

  def card_number
    last_four = session[:checkout_params]['card_number'].split(//).last(4).join
    "**** **** **** #{last_four}"
  end

  def mm_yy
    session[:checkout_params]['mm_yy']
  end

  def error_message_for(field)
    @checkout.errors.full_messages_for(field).first
  end

  def delivery_days(delivery)
    "#{delivery.days_from} to #{delivery.days_to} days"
  end

  def delivery_price(delivery)
    delivery.price.zero? ? 'Free' : number_to_euro(delivery.price)
  end

  def country_name(country_code)
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end
end
