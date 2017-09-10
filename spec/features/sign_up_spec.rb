# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sign Up', type: :feature do
  feature 'Sign Up' do
    before(:each) do
      FactoryGirl.create(:book)
    end

    scenario 'Singing up' do
      expect do
        visit '/sign_up'
        within('#new_user') do
          fill_in 'email', with: FFaker::Internet.email
          fill_in 'password', with: 'qwertyQ2'
          fill_in 'confirm', with: 'qwertyQ2'
        end
        click_button 'Sign up'

      end.to change { User.count }.by(1)
    end
  end
end
