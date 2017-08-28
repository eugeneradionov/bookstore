FactoryGirl.define do
  factory :order_item do
    book_id nil
    quantity { rand(10) }
    order_id nil
    cart_id nil
  end
end