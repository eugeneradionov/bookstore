# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Header', type: :feature do
  feature 'Header' do
    before(:each) { FactoryGirl.create(:book) }

    let(:user) { FactoryGirl.create(:user) }

    context 'User is not logged in' do
      before(:each) { visit root_path }

      it 'does not show My account' do
        expect(find('header')).not_to have_content 'My account'
      end

      it 'shows Log in' do
        expect(find('header')).to have_content 'Log in'
      end

      it 'shows Sign up' do
        expect(find('header')).to have_content 'Sign up'
      end
    end

    context 'User is logged in' do
      before(:each) do
        login_as(user, scope: :user)
        visit root_path
      end

      it 'shows My account' do
        expect(page).to have_content 'My account'
      end

      it 'does not show Log in' do
        expect(find('header')).not_to have_content 'Log in'
      end

      it 'does not show Sign up' do
        expect(find('header')).not_to have_content 'Sign up'
      end
    end
  end
end
