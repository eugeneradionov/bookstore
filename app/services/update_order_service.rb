class UpdateOrderService
  def initialize(checkout, order)
    @checkout = checkout
    @order = order
    @cart = @checkout.cart
  end

  def update_order
    case @checkout.current_step
    when :address
      billing_a_hash = { first_name: @checkout.billing_first_name.strip,
                         last_name: @checkout.billing_last_name.strip,
                         address: @checkout.billing_address.strip,
                         city: @checkout.billing_city.strip,
                         zip: @checkout.billing_zip.strip,
                         country: @checkout.billing_country,
                         phone: @checkout.billing_phone.strip }
      billing_a = BillingAddress.find_or_create_by(billing_a_hash)

      shipping_a = if @checkout.use_billing_address?
                     ShippingAddress.find_or_create_by(billing_a_hash)
                   else
                     ShippingAddress.find_or_create_by(
                         first_name: @checkout.shipping_first_name.strip,
                         last_name: @checkout.shipping_last_name.strip,
                         address: @checkout.shipping_address.strip,
                         city: @checkout.shipping_city.strip,
                         zip: @checkout.shipping_zip.strip,
                         country: @checkout.shipping_country,
                         phone: @checkout.shipping_phone.strip)
                   end

      @order.update(shipping_address: shipping_a, billing_address: billing_a,
                    use_billing_address: @checkout.use_billing_address)

    when :delivery
      delivery = @checkout.delivery_method || @order.delivery
      @order.update(delivery: delivery)

    when :payment
      payment = Payment.find_or_create_by!(card_number: @checkout.card_number,
                                           cvv: @checkout.cvv,
                                           mm_yy: @checkout.mm_yy)
      @order.update(payment: payment)

    when :complete
      order_status = OrderStatus.find_by(status: 'Waiting for Processing')
      @order.update(order_items: @cart.order_items)
      @order.update(order_status: order_status)
    end

    return @order
  end
end
