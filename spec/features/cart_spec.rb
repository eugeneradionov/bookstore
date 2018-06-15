# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cart Page', type: :feature do
  feature 'Cart Page' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @book = FactoryGirl.create(:book)
      login_as(@user, scope: :user)

      @user.cart = Cart.create(user_id: @user.id)
      OrderItem.create(book_id: @book.id, cart_id: @user.cart.id)
      visit cart_path
    end

    scenario 'Redirect to book when clicks on title' do
      find('.hidden-xs .title').click
      expect(current_path).to eq(book_path(@book))
    end

    scenario 'Redirect to book when clicks on image' do
      find('.hidden-xs .general-img-wrap-table a').click
      expect(current_path).to eq(book_path(@book))
    end

    scenario 'Delete order item when clicks on X' do
      find('.hidden-xs .close').click
      expect(page).to have_content('Your cart is empty')
    end

    scenario 'Checkout' do
      find('.text-center .hidden-xs').click
      expect(current_path).to eq(checkout_path)
    end
  end
end
