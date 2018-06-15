module CurrentCart
  extend ActiveSupport::Concern

  private

  def set_cart
    if user_signed_in?
      @cart = current_user.cart
      @cart = Cart.create(user_id: current_user.id) unless @cart
    else
      begin
        @cart = Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
    end
  end
end
