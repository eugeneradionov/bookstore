class Setting
  include ActiveModel::Model
  attr_accessor :shipping_first_name, :shipping_last_name, :shipping_address,
                :shipping_city, :shipping_zip, :shipping_country, :shipping_phone,
                :billing_first_name, :billing_last_name, :billing_address,
                :billing_city, :billing_zip, :billing_country, :billing_phone
  attr_accessor :user, :email
  attr_accessor :saving

  validates_presence_of :billing_first_name, :billing_last_name, :billing_address,
                        :billing_city, :billing_zip, :billing_country, :billing_phone,
                        :shipping_first_name, :shipping_last_name, :shipping_address,
                        :shipping_city, :shipping_zip, :shipping_country, :shipping_phone,
                        if: :saving_address?
  validates :email, presence: true, if: :saving_email?

  def save_address
    transaction do
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

      UserInfo.find_or_create_by!(user_id: user.id,
                                  shipping_address: shipping_a,
                                  billing_address: billing_a)
    end
  end

  def save_email
    if !User.find_by(email: email)
      transaction do
        User.find(user.id).update!(email: email)
      end
    else
      errors.add(:email, 'must be unique')
    end
  end

  def save_password
    return false if invalid?
  end

  def delete_account
  end

  private

  def saving_email?
    saving == 'email'
  end

  def saving_address?
    saving == 'address'
  end

  def transaction(&block)
    return false if invalid?

    begin
      ActiveRecord::Base.transaction do
        block.call
      end
    rescue ActiveRecord::StatementInvalid => e
      errors.add(:base, e.message)
      return false
    end
  end
end
