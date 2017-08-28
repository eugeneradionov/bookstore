# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  describe 'GET #show' do
    it 'returns a success response' do
      cart = FactoryGirl.create(:cart)
      get :show, params: { id: cart.to_param }
      expect(response).to be_success
    end

    it 'renders :show template' do
      get :show
      expect(response).to render_template :show
    end
  end

  describe 'POST #update' do
    it 'sets coupon to params' do
      expect(controller).to receive(:set_coupon_to_params)
      post :update
    end
  end

  # describe 'DELETE #destroy' do
  #   xit 'destroys the requested cart' do
  #     cart = Cart.create! valid_attributes
  #     expect do
  #       delete :destroy, params: { id: cart.to_param }
  #     end.to change(Cart, :count).by(-1)
  #   end
  #
  #   xit 'redirects to the carts list' do
  #     cart = Cart.create! valid_attributes
  #     delete :destroy, params: { id: cart.to_param }
  #     expect(response).to redirect_to(carts_url)
  #   end
  # end
end
