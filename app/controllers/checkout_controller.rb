# frozen_string_literal: true

class CheckoutController < ApplicationController

  before_action :redirect_to_login_unless_user_logged_in
  before_action :redirect_to_catalog_if_cart_empty, except: :complete
  before_action :initialize_order
  before_action :initialize_checkout
  before_action :initialize_cart
  before_action :set_order_cart
  authorize_resource

  def new
    @order.order_items = @cart.order_items

    current_step = params[:current_step] || @order.aasm_state
    @checkout.current_step = current_step.to_sym

    set_shipping_and_billing_address
  end

  def create
    @order.order_items = @cart.order_items
    @checkout.use_billing_address = checkout_params[:use_billing_address] || @order.use_billing_address
    set_shipping_and_billing_address

    CheckoutStepsControlService.new(@checkout, @order, params).control_step

    render 'new'
  end

  private

  def initialize_order
    user = current_user
    order = user.orders.in_progress.first

    if order
      @order = order
    else
      order_status = OrderStatus.find_by(status: 'In Progress')
      @order = Order.create(user: user, order_status: order_status,
                            aasm_state: 'address')
    end
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
      @shipping_a = @order.shipping_address || ShippingAddress.new
    end
  end

  def set_billing_address
    user_info = current_user.user_info
    begin
      @billing_a = BillingAddress.find(user_info.billing_address_id)
    rescue NoMethodError
      @billing_a = @order.billing_address || BillingAddress.new
    end
  end

  def initialize_checkout
    @checkout = Checkout.new(checkout_params)
    begin
      delivery = Delivery.find(@checkout.delivery_method)
    rescue ActiveRecord::RecordNotFound
      delivery = @order.delivery
    end

    @checkout.delivery_method = delivery
    @checkout.current_step = @order.aasm_state.to_sym
  end

  def initialize_cart
    @checkout.cart = @cart
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
end
