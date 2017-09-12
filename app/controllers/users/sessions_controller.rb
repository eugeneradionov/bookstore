class Users::SessionsController < Devise::SessionsController
  include RegistrationLoginCartSetup
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    redirect_to root_path if user_signed_in?
    super
  end

  # POST /resource/sign_in
  def create
    super
    current_user.cart = setup_cart
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
