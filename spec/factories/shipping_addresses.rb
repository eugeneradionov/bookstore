FactoryGirl.define do
  factory :shipping_address do
    first_name FFaker::Name.first_name
    last_name FFaker::Name.last_name
    address FFaker::Address.street_address
    city FFaker::Address.city
    zip FFaker::AddressUS.zip_code
    country 'US'
    phone '+380 11 132 12 12'
  end
end
