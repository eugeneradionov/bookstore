# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Ability', type: :feature do
  feature 'Ability' do
    before(:each) do
      @book = FactoryGirl.create(:book)
    end

    context 'Guest User' do
      scenario 'Can read Book' do
        visit book_path(@book)
        expect(page).to have_content('Materials')
      end

      scenario 'Visit Checkout' do
        visit checkout_path
        expect(page.current_path).to eq(checkout_login_path)
      end

      scenario 'Visit Checkout with full cart' do
        visit book_path(@book)
        click_button('Add to Cart')
        visit checkout_path
        expect(page.current_path).to eq(checkout_login_path)
      end

      scenario 'Can read Cart' do
        visit book_path(@book)
        click_button('Add to Cart')
        visit cart_path
        expect(page.current_path).to eq(cart_path)
        expect(page).not_to have_content('Your cart is empty')
      end
    end

    context 'Logged in User' do
      before(:each) do
        @user = FactoryGirl.create(:user)
        login_as(@user, scope: :user)
      end

      scenario 'Visit Checkout with empty cart' do
        visit checkout_path
        expect(page.current_path).to eq(catalog_path)
      end

      scenario 'Can read Order' do
        delivery = FactoryGirl.create(:delivery)
        payment = FactoryGirl.create(:payment)
        order_status = FactoryGirl.create(:order_status)
        shipping_address = FactoryGirl.create(:shipping_address)
        billing_address = FactoryGirl.create(:billing_address)
        order = FactoryGirl.create(:order, delivery_id: delivery.id, user_id: @user.id,
                                   payment_id: payment.id, order_status_id: order_status.id,
                                   shipping_address_id: shipping_address.id,
                                   billing_address_id: billing_address.id)
        visit order_path(order)
        expect(page).to have_content('Order')
      end
    end
  end
end
