class Checkout
  include ActiveModel::Model
  include AASM

  aasm do
    state :address, initial: true
    state :delivery
    state :payment
    state :confirm
    state :complete

    event :next_step do
      transitions from: :address, to: :delivery
      transitions from: :delivery, to: :payment
      transitions from: :payment, to: :confirm
      transitions from: :confirm, to: :complete
    end

    event :previous_step do
      transitions from: :delivery, to: :address
      transitions from: :payment, to: :delivery
      transitions from: :confirm, to: :payment
    end
  end

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
                        if: lambda { |checkout| checkout.address_step? }

  validates_presence_of :shipping_first_name, :shipping_last_name, :shipping_address,
                        :shipping_city, :shipping_zip, :shipping_country, :shipping_phone,
                        if: lambda { |checkout| checkout.use_billing_address == '0' && checkout.address_step? }

  validates_presence_of :delivery_method,
                        if: lambda { |checkout| checkout.delivery_step? }

  validate :card_number_validation, :mm_yy_validation, :cvv_validation,
           if: lambda { |checkout| checkout.payment_step? }

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

  def current_step
    aasm.current_state
  end

  def current_step=(value)
    aasm.current_state = value
  end

  def first_step?
    address_step?
  end

  def last_step?
    confirm_step?
  end

  def delivery_step?
    aasm.current_state == :delivery
  end

  def confirm_step?
    aasm.current_state == :confirm
  end

  def complete_step?
    aasm.current_state == :complete
  end

  def address_step?
    aasm.current_state == :address
  end

  def payment_step?
    aasm.current_state == :payment
  end

  def use_billing_address?
    use_billing_address.to_s == '1' ? true : false
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
end