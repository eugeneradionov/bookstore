# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReviewsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/reviews').to route_to('reviews#create')
    end

    it 'routes to #destroy' do
      expect(delete: '/reviews/1').to route_to('reviews#destroy', id: '1')
    end
  end
end
