# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Singing in', type: :feature do
  feature 'Signing in' do
    before(:each) do
      FactoryGirl.create(:book)
      @user = FactoryGirl.create(:user)
    end

    scenario 'Signing in with correct credentials' do
      visit '/login'
      within('#new_user') do
        fill_in 'email', with: @user.email
        fill_in 'password', with: 'qwertyQ2'
      end
      click_button 'Log in'
      expect(current_path).to eq(root_path)
    end

    scenario 'Signing in as another user' do
      visit '/login'
      within('#new_user') do
        fill_in 'email', with: @user.email
        fill_in 'password', with: 'qwerty'
      end
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end
  end
end
