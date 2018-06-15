module CartsHelper
  def cart_discount(cart)
    discount = cart.discount
    discount ? number_to_euro(discount) : number_to_euro(0)
  end
end
