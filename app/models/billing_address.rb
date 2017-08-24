class BillingAddress < ApplicationRecord
  has_many :orders

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
