FactoryGirl.define do
  factory :order do
    delivery_id nil
    cart_id nil
    user_id nil
    payment_id nil
    order_status_id nil
    discount nil
  end
end