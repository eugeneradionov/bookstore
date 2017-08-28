class CheckoutController < ApplicationController
  attr_writer :current_step
  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  before_action :redirect_to_login_unless_user_logged_in, except: :login
  before_action :redirect_to_catalog_if_cart_empty, except: :complete
  before_action :set_order_cart
  authorize_resource

  def new
    session[:checkout_params] ||= {}
    initialize_checkout
    initialize_cart

    current_step = params[:current_step] || session[:current_step]
    set_session_current_step(current_step)
    @checkout.current_step = current_step

    set_shipping_and_billing_address

    if session[:order_id]
      @order = Order.find(session[:order_id])
      @user = @order.user
    end
  end

  def create
    session[:checkout_params].deep_merge!(checkout_params) if checkout_params
    initialize_checkout
    initialize_cart

    @checkout.current_step = session[:current_step]
    @checkout.use_billing_address = session[:checkout_params]['use_billing_address']
    set_shipping_address_as_billing if @checkout.address_step? && @checkout.use_billing_address?

    set_shipping_and_billing_address

    if params[:back_button]
      @checkout.previous_step
    elsif @checkout.valid?
      if params[:place_order_button]
        @checkout.user = current_user
        @checkout.save if @checkout.all_valid? # TODO: Refactor?
      elsif params[:back_to_confirm_button]
        @checkout.current_step = 'confirm'
      else
        @checkout.next_step
      end
    end

    set_session_current_step(@checkout.current_step)

    if @checkout.saved
      set_order_items
      update_cart
      set_complete_session_params
      set_session_current_step('complete')

      redirect_to checkout_complete_path
    else
      render 'new'
    end
  end

  def complete
    @order = Order.find(session[:order_id])
    cart = Cart.new
    cart.order_items = @order.order_items
    @order_cart = cart
    @user = @order.user
    @shipping_address = @order.shipping_address
    delivery = @order.delivery
    @checkout = Checkout.new(delivery_method: delivery)

    session[:current_step] = nil
    render '_checkout_complete'
  end

  def login
    render 'checkout/login'
  end

  private

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

  def initialize_checkout
    @checkout = Checkout.new(session[:checkout_params])
  end

  def initialize_cart
    @checkout.cart = @cart
  end

  def set_session_current_step(step)
    session[:current_step] = step
  end

  def set_complete_session_params
    session[:cart_id] = nil
    session[:checkout_params] = nil
    session[:order_id] = @order.id
  end

  def set_order_items
    @order = @checkout.order
    @order.order_items = @cart.order_items
  end

  def update_cart
    order_items_ids = "(#{@cart.order_items.ids.join(',')})"
    @cart.order_items.where("id IN #{order_items_ids}").update_all(cart_id: nil)
    @cart.update(discount: nil)
  end

  def set_shipping_address_as_billing
    session[:checkout_params]['shipping_first_name'] = @checkout.billing_first_name
    session[:checkout_params]['shipping_last_name'] = @checkout.billing_last_name
    session[:checkout_params]['shipping_address'] = @checkout.billing_address
    session[:checkout_params]['shipping_city'] = @checkout.billing_city
    session[:checkout_params]['shipping_zip'] = @checkout.billing_zip
    session[:checkout_params]['shipping_country'] = @checkout.billing_country
    session[:checkout_params]['shipping_phone'] = @checkout.billing_phone
  end

  def checkout_params
    params.fetch(:checkout, {})
          .permit(:shipping_first_name, :shipping_last_name,
                  :shipping_address, :shipping_city, :shipping_zip,
                  :shipping_country, :shipping_phone,
                  :billing_first_name, :billing_last_name,
                  :billing_address, :billing_city, :billing_zip,
                  :billing_country, :billing_phone, :delivery_method,
                  :card_number, :cvv, :mm_yy, :use_billing_address, :current_step)
  end

  def set_order_cart
    @order_cart ||= @cart
  end

  def redirect_to_login_unless_user_logged_in
    redirect_to checkout_login_path unless user_signed_in?
  end

  def redirect_to_catalog_if_cart_empty
    redirect_to catalog_path if @cart.empty?
  end

  # == Devise custom form ==

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
