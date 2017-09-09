# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Catalog Page', type: :feature do
  feature 'Catalog Page' do
    before(:each) do
      Helpers.books_seed
      visit catalog_path
    end

    # scenario 'Click View More button', js: true do
    #   find('#view-more-books').click
    #   wait_for_ajax
    #   expect(page).to have_selector('#books-container .row', count: 6)
    # end


  end
end
