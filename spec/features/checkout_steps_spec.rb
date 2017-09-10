# # frozen_string_literal: true
#
# require 'rails_helper'
#
# RSpec.describe 'Checkout', type: :feature do
#   before(:each) do
#     FactoryGirl.create(:delivery)
#     @user = FactoryGirl.create(:user)
#     @book = FactoryGirl.create(:book)
#     login_as(@user, scope: :user)
#
#     @user.cart = Cart.create(user_id: @user.id)
#     OrderItem.create(book_id: @book.id, cart_id: @user.cart.id)
#     visit checkout_path
#
#     find_field('checkout[billing_first_name]').set(FFaker::Name.first_name)
#     find_field('checkout[billing_last_name]').set(FFaker::Name.last_name)
#     find_field('checkout[billing_address]').set(FFaker::Address.street_address)
#     find_field('checkout[billing_city]').set(FFaker::Address.city)
#     find_field('checkout[billing_zip]').set(FFaker::AddressUS.zip_code)
#     find_field('checkout[billing_country]').find(:xpath, 'option[2]').select_option
#     find_field('checkout[billing_phone]').set('+380 11 132 12 12')
#   end
#
#   feature 'Address step' do
#     context 'Do not use billing address checkbox' do
#       scenario 'Filling in Billing and Shipping Addresses' do
#
#         find_field('checkout[shipping_first_name]').set(FFaker::Name.first_name)
#         find_field('checkout[shipping_last_name]').set(FFaker::Name.last_name)
#         find_field('checkout[shipping_address]').set(FFaker::Address.street_address)
#         find_field('checkout[shipping_city]').set(FFaker::Address.city)
#         find_field('checkout[shipping_zip]').set(FFaker::AddressUS.zip_code)
#         find_field('checkout[shipping_country]').find(:xpath, 'option[2]').select_option
#         find_field('checkout[shipping_phone]').set('+380 11 132 12 12')
#
#         click_button('Save and Continue')
#         expect(page).to have_css('.radio')
#       end
#     end
#
#     context 'Use billing address checkbox' do
#       scenario 'Filling in Billing Address' do
#         first(:css, '#checkout_use_billing_address', visible: false).set(true)
#
#         click_button('Save and Continue')
#         expect(page).to have_css('.radio')
#       end
#     end
#   end
#
#   feature 'Delivery step' do
#     scenario 'Choose delivery method' do
#       first(:css, '#checkout_use_billing_address', visible: false).set(true)
#       click_button('Save and Continue')
#
#       first(:css, '#checkout_delivery_method_1', visible: false).set(true)
#       click_button('Save and Continue')
#
#       expect(page).to have_css('#cardNumber')
#     end
#   end
#
#   feature 'Payment step' do
#     scenario 'Filling in Payment info' do
#       first(:css, '#checkout_use_billing_address', visible: false).set(true)
#       click_button('Save and Continue')
#
#       first(:css, '#checkout_delivery_method_1', visible: false).set(true)
#       click_button('Save and Continue')
#
#       find_field('checkout[card_number]').set('1234123412341234')
#       find_field('checkout[name_on_card]').set('Name on Card')
#       find_field('checkout[mm_yy]').set('12/12')
#       find_field('checkout[cvv]').set('123')
#       click_button('Save and Continue')
#
#       expect(page).to have_css('.general-edit')
#     end
#   end
#
#   feature 'Complete step' do
#     scenario 'Filling in Payment info' do
#       first(:css, '#checkout_use_billing_address', visible: false).set(true)
#       click_button('Save and Continue')
#
#       first(:css, '#checkout_delivery_method_1', visible: false).set(true)
#       click_button('Save and Continue')
#
#       find_field('checkout[card_number]').set('1234123412341234')
#       find_field('checkout[name_on_card]').set('Name on Card')
#       find_field('checkout[mm_yy]').set('12/12')
#       find_field('checkout[cvv]').set('123')
#       click_button('Save and Continue')
#
#       OrderStatus.create(status: 'Waiting for Processing')
#       click_button('Place Order')
#
#       expect(page).to have_content('Thank You for your Order!')
#     end
#   end
# end
