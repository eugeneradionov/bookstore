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
        fill_in 'Rating', with: '3'
        fill_in 'Text', with: FFaker::Lorem.paragraph
      end
      click_button 'Add Review'
      expect(current_path).to eq(book_path(@book))
    end

    # scenario 'Can increase book quantity' do
    #   find('#plus').click
    #   expect(find('#quantity').value).to eq('2')
    # end

    # scenario 'Can decrease book quantity' do
    #   find('#plus').click
    #   find('#plus').click
    #   find('#minus').click
    #   expect(find('#quantity').value).to eq('2')
    # end
  end
end
