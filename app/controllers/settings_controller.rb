class SettingsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @settings = Setting.new

    set_shipping_and_billing_address
    render 'settings'
  end

  def update
    @settings = Setting.new(settings_params)
    @settings.user = current_user

    if params[:save_address_button]
      @settings.saving = 'address'
      @settings.save_address
    elsif params[:save_email_button]
      @settings.saving = 'email'
      @settings.save_email
    end

    set_shipping_and_billing_address
    render 'settings'
  end

  def destroy
  end

  private

  def settings_params
    params.fetch(:setting, {})
          .permit(:shipping_first_name, :shipping_last_name,
                  :shipping_address, :shipping_city, :shipping_zip,
                  :shipping_country, :shipping_phone,
                  :billing_first_name, :billing_last_name,
                  :billing_address, :billing_city, :billing_zip,
                  :billing_country, :billing_phone, :email)
  end

  def set_shipping_and_billing_address
    set_shipping_address
    set_billing_address
  end

  def set_shipping_address
    user_info = current_user.user_info
    begin
      @shipping_a = ShippingAddress.find(user_info.shipping_address_id)
    rescue NoMethodError
      @shipping_a = ShippingAddress.new
    end
  end

  def set_billing_address
    user_info = current_user.user_info
    begin
      @billing_a = BillingAddress.find(user_info.billing_address_id)
    rescue NoMethodError
      @billing_a = BillingAddress.new
    end
  end
end
