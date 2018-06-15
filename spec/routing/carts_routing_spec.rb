# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartsController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/cart').to route_to('carts#show')
    end

    it 'routes to #update via POST' do
      expect(post: '/cart').to route_to('carts#update')
    end
  end
end
