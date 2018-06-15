# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Log Out', type: :feature do
  feature 'Log Out' do
    scenario 'Logging out' do
      FactoryGirl.create(:book)
      @user = FactoryGirl.create(:user)
      login_as(@user, scope: :user)
      visit root_path

      first(:link, 'Logout').click
      expect(page).to have_content('Log in')
    end
  end
end
