class CheckoutStepsControlService
  attr_reader :params

  def initialize(checkout, order, params)
    @checkout = checkout
    @order =  order
    @params = params
  end

  def control_step
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
  end

  private

  def update_cart
    order_items_ids = "(#{@checkout.cart.order_items.ids.join(',')})"
    @checkout.cart.order_items.where("id IN #{order_items_ids}").update_all(cart_id: nil)
    @checkout.cart.update(discount: nil)
  end

  def update_order_step
    @order.update(aasm_state: @checkout.current_step)
  end

  def update_order
    @order = UpdateOrderService.new(@checkout, @order).update_order
  end
end
