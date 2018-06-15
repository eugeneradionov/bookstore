module SettingsHelper
  def settings_shipping_first_name
    @shipping_a.first_name
  end

  def settings_shipping_last_name
    @shipping_a.last_name
  end

  def settings_shipping_address
    @shipping_a.address
  end

  def settings_shipping_city
    @shipping_a.city
  end

  def settings_shipping_zip
    @shipping_a.zip
  end

  def settings_shipping_country
    @shipping_a.country
  end

  def settings_shipping_phone
    @shipping_a.phone
  end

  def settings_billing_first_name
    @billing_a.first_name
  end

  def settings_billing_last_name
    @billing_a.last_name
  end

  def settings_billing_address
    @billing_a.address
  end

  def settings_billing_city
    @billing_a.city
  end

  def settings_billing_zip
    @billing_a.zip
  end

  def settings_billing_country
    @billing_a.country
  end

  def settings_billing_phone
    @billing_a.phone
  end

  def settings_user_email
    current_user.email
  end
end