FactoryGirl.define do
  factory :delivery do
    add_attribute :method, 'qweqwe'
    price 10.10
    days_from 1
    days_to 2
  end
end