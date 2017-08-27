FactoryGirl.define do
  factory :user do
    email "test.example@example.com"
    password "qwertyQ2"
    encrypted_password "MyString"
    reset_password_token "MyString"
    sign_in_count 1
    current_sign_in_ip ""
    last_sign_in_ip ""
    first_name "MyString"
    last_name "MyString"
    provider "MyString"
    uid "MyString"
  end
end
