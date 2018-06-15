FactoryGirl.define do
  factory :order_status do
    status FFaker::Lorem.phrase
  end
end