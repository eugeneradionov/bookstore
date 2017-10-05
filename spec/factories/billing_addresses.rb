FactoryGirl.define do
  factory :billing_address do
    first_name 'MyString'
    last_name 'MyString'
    address 'MyString'
    city 'MyString'
    zip 1234
    country 'US'
    phone '+380 33 321 12 34'
  end
end
