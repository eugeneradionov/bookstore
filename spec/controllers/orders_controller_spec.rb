# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  before do
    @user = FactoryGirl.create(:user)
    @cart = FactoryGirl.create(:cart)
    @delivery = FactoryGirl.create(:delivery)
    @shipping_address = FactoryGirl.create(:shipping_address)
    @billing_address = FactoryGirl.create(:billing_address)
    @payment = FactoryGirl.create(:payment)
    @order_status = FactoryGirl.create(:order_status)

    sign_in @user
  end

  let(:valid_attributes) do
    { delivery_id: @delivery.id, cart_id: @cart.id,
      user_id: @user.id, payment_id: @payment.id,
      shipping_address_id: @shipping_address.id,
      billing_address_id: @billing_address.id,
      order_status_id: @order_status.id }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      order = Order.create! valid_attributes
      get :index
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      order = Order.create! valid_attributes
      get :show, params: { id: order.to_param }
      expect(response).to be_success
    end
  end
end
