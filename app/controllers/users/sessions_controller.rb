class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    redirect_to root_path if user_signed_in?
    super
  end

  # POST /resource/sign_in
  def create
    super
    session_cart = Cart.find(session[:cart_id]) if session[:cart_id]
    current_user.cart = if session_cart&.empty?
                          current_user.cart
                        else
                          session_cart
                        end
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
