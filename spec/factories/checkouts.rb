FactoryGirl.define do
  factory :checkout do
    current_step 'address'
    cart nil
    user nil
    order nil

    shipping_first_name FFaker::Name.first_name
    shipping_last_name FFaker::Name.last_name
    shipping_address FFaker::Address.street_address
    shipping_city FFaker::Address.city
    shipping_zip FFaker::AddressUS.zip_code
    shipping_country FFaker::Address.country
    shipping_phone '+38066111111'

    billing_first_name FFaker::Name.first_name
    billing_last_name FFaker::Name.last_name
    billing_address FFaker::Address.street_address
    billing_city FFaker::Address.city
    billing_zip FFaker::AddressUS.zip_code
    billing_country FFaker::Address.country
    billing_phone '+38066111111'

    use_billing_address '0'
    delivery_method '1'

    card_number '1234123412341234'
    name_on_card FFaker::Name.html_safe_name
    cvv '123'
    mm_yy '12/12'

    saved nil
  end
end
