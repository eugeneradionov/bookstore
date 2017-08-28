class Checkout
  include ActiveModel::Model

  attr_writer :current_step
  attr_accessor :cart, :user, :order
  attr_accessor :shipping_first_name, :shipping_last_name, :shipping_address,
                :shipping_city, :shipping_zip, :shipping_country, :shipping_phone,
                :billing_first_name, :billing_last_name, :billing_address,
                :billing_city, :billing_zip, :billing_country, :billing_phone,
                :use_billing_address,
                :delivery_method, :card_number, :name_on_card, :cvv, :mm_yy
  attr_accessor :saved

  validates_presence_of :billing_first_name, :billing_last_name, :billing_address,
                        :billing_city, :billing_zip, :billing_country, :billing_phone,
                        if: 'address_step?'

  validates_presence_of :shipping_first_name, :shipping_last_name, :shipping_address,
                        :shipping_city, :shipping_zip, :shipping_country, :shipping_phone,
                        if: lambda { |checkout| checkout.use_billing_address == '0' && checkout.address_step? }

  validates_presence_of :delivery_method,
                        if: lambda { |checkout| checkout.current_step == 'delivery' }

  validate :card_number_validation, :mm_yy_validation, :cvv_validation,
           if: lambda {|checkout| checkout.current_step == 'payment'}

  def card_number_validation
    errors.add(:card_number, 'must consist only from numbers') unless
    card_number.match?(/^(\d{4}[- ]){3}\d{4}|\d{16}$/)
  end

  def mm_yy_validation
    errors.add(:mm_yy, 'must contain 2 digits of month / 2 digits of year') unless
    mm_yy.to_s.match?(/^((0[1-9])|(1[0-2]))\/(\d{2})$/)
  end

  def cvv_validation
    errors.add(:cvv, 'must be a three or four digit number') unless
    cvv.to_s.match?(/^([0-9]{3,4})$/)
  end

  def save
    return false if invalid?

    begin
      ActiveRecord::Base.transaction do
        billing_a = BillingAddress.find_or_create_by!(first_name: billing_first_name.strip,
                                                      last_name: billing_last_name.strip,
                                                      address: billing_address.strip,
                                                      city: billing_city.strip,
                                                      zip: billing_zip,
                                                      country: billing_country,
                                                      phone: billing_phone.strip)

        shipping_a = ShippingAddress.find_or_create_by!(first_name: shipping_first_name.strip,
                                                        last_name: shipping_last_name.strip,
                                                        address: shipping_address.strip,
                                                        city: shipping_city.strip,
                                                        zip: shipping_zip,
                                                        country: shipping_country,
                                                        phone: shipping_phone.strip)

        delivery = Delivery.find(delivery_method)
        payment = Payment.find_or_create_by(card_number: card_number, cvv: cvv,
                                            mm_yy: mm_yy)

        order_status = OrderStatus.find_by!(status: 'Waiting for Processing')
        @order = Order.create!(user_id: user.id, cart_id: cart.id,
                               billing_address_id: billing_a.id,
                               shipping_address_id: shipping_a.id,
                               delivery_id: delivery.id, payment_id: payment.id,
                               order_status_id: order_status.id,
                               discount: cart.discount)
      end

    rescue ActiveRecord::StatementInvalid => e
      errors.add(:base, e.message)
      return false
    end
    self.saved = true
  end

  def current_step
    @current_step || steps.first
  end

  def steps
    %w[address delivery payment confirm complete]
  end

  def next_step
    self.current_step = steps[steps.index(current_step) + 1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step) - 1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    confirm_step?
  end

  def confirm_step?
    current_step == 'confirm'
  end

  def complete_step?
    current_step == 'complete'
  end

  def address_step?
    current_step == 'address'
  end

  def use_billing_address?
    use_billing_address.to_s == '1'
  end

  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end

  def order_total(cart)
    begin
      delivery_price = Delivery.find(delivery_method).price
    rescue ActiveRecord::RecordNotFound
      delivery_price = 0
    rescue ArgumentError
      delivery_price = 0
    end
    cart.order_total + delivery_price
  end

  def delivery
    @delivery = Delivery.find(delivery_method)
  rescue ActiveRecord::RecordNotFound
    @delivery
  rescue ArgumentError
    @delivery
  end
end