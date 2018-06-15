module RegistrationLoginCartSetup
  extend ActiveSupport::Concern

  private

  def setup_cart
    session_cart = Cart.find(session[:cart_id]) if session[:cart_id]
    session_cart&.empty? ? current_user.cart : session_cart
  end
end
