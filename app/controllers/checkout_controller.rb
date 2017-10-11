# frozen_string_literal: true

class CheckoutController < ApplicationController
  include RegistrationLoginCartSetup

  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  before_action :redirect_to_login_unless_user_logged_in, except: [:login, :sign_up]
  before_action :redirect_to_catalog_if_cart_empty, except: :complete
  before_action :initialize_order, except: [:login, :sign_up]
  before_action :initialize_checkout, except: [:login, :sign_up]
  before_action :initialize_cart, except: [:login, :sign_up]
  before_action :set_order_cart, except: [:login, :sign_up]
  authorize_resource except: :sign_up

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

    if params[:back_button]
      @checkout.previous_step
      @order.update(aasm_state: @checkout.current_step)
    elsif @checkout.valid?
      if params[:place_order_button]
        update_cart
        @checkout.current_step = :complete
        update_order_step
        update_order
      elsif params[:back_to_confirm_button]
        @checkout.current_step = :confirm
      else
        update_order
        @checkout.next_step
        update_order_step
      end
    end

    render 'new'
  end

  def login
    @user = User.new
    render 'login'
  end

  def sign_up
    password = "#{Devise.friendly_token[0, 8]}Q2"
    @user = User.new(email: user_params[:email], password: password)

    respond_to do |format|
      if @user.save
        sign_in(:user, @user)
        RegistrationMailer.checkout_registration_email(@user, password).deliver_later
        current_user.cart = setup_cart

        format.html { redirect_to checkout_path, notice: "Email with your password has been sent to #{@user.email}" }
      else
        format.html { render 'login' }
      end
    end
  end

  private

  def update_order
    @order = UpdateOrderService.new(@checkout, @order).update_order
  end

  def update_order_step
    @order.update(aasm_state: @checkout.current_step)
  end

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

  def update_cart
    order_items_ids = "(#{@cart.order_items.ids.join(',')})"
    @cart.order_items.where("id IN #{order_items_ids}").update_all(cart_id: nil)
    @cart.update(discount: nil)
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

  def user_params
    params.require(:user).permit(:email)
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
