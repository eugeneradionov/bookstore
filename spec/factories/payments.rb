FactoryGirl.define do
  factory :payment do
    card_number '1234123412341234'
    mm_yy '12/12'
    cvv '123'
  end
end
