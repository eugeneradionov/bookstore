class CheckoutRegistrationController < ApplicationController
  include RegistrationLoginCartSetup

  helper_method :resource_name, :resource, :devise_mapping, :resource_class

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

  def user_params
    params.require(:user).permit(:email)
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
