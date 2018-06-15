class ShippingAddress < ApplicationRecord
  has_many :orders
  validates :first_name, length: { maximum: 50 }
  validates :last_name, length: { maximum: 50 }
  validates :address, length: { maximum: 50 }
  validates :country, length: { maximum: 50 }
  validates :city, length: { maximum: 50 }
  validates :zip, length: { maximum: 10 }


  rails_admin do
    object_label_method :full_address
  end

  def full_address
    "#{address} #{city} #{country_name(country)} #{zip}"
  end

  def country_name(country_code)
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end
end
