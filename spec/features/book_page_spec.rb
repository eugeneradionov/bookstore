# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Book Page', type: :feature do
  feature 'Book Page' do
    let(:user) { FactoryGirl.create(:user) }

    before(:each) do
      @book = FactoryGirl.create(:book)
      login_as(user, scope: :user)
      visit book_path(@book)
    end

    scenario 'Can add book to cart' do
      click_button('Add to Cart')
      expect(find('.hidden-xs .shop-quantity').text).to eq('1')
    end

    scenario 'Writing a review' do
      within('#new_review') do
        fill_in 'Title', with: 'test title'
        find_field('review[rating]').find(:xpath, 'option[3]').select_option
        fill_in 'Text', with: FFaker::Lorem.paragraph
      end
      click_button 'Add Review'
      expect(current_path).to eq(book_path(@book))
    end
  end
end
