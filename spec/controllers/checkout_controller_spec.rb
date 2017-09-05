# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CheckoutController, type: :controller do
  # let(:user) { FactoryGirl.create(:user) }
  # let(:cart) { FactoryGirl.create(:cart) }
  # let(:book) { FactoryGirl.create(:book) }
  # let(:order_item) { FactoryGirl.create(:order_item, book_id: book.id, cart_id: cart.id) }
  #
  # before(:each) do
  #   @user = user
  #   @request.env['devise.mapping'] = Devise.mappings[:user]
  #   sign_in @user
  #
  #   @cart = cart
  #   @cart.order_items << order_item
  #   @checkout = FactoryGirl.build(:checkout, cart: @cart, user: @user)
  #
  #   controller.instance_variable_set(:@cart, @cart)
  #   controller.instance_variable_set(:@checkout, @checkout)
  # end
  #
  # describe 'GET #new' do
  #   it 'returns a successful response' do
  #     get :new
  #     expect(response).to be_success
  #   end
  #   # it 'stores checkout_params in session' do
  #   #   expect(session[:checkout_params]).not_to be_nil
  #   #   get :new
  #   # end
  #   #
  #   # it 'initializes checkout' do
  #   #   expect(controller).to receive(:initialize_checkout)
  #   #   get :new
  #   # end
  #   #
  #   # it 'initializes cart' do
  #   #   expect(controller).to receive(:initialize_cart)
  #   #   get :new
  #   # end
  #   #
  #   # it 'sets current step to session' do
  #   #   expect(sesison[:current_step]).not_to be_nil
  #   #   get :new
  #   # end
  #   #
  #   # it 'calls set_shipping_and_billing_address' do
  #   #   expect(controller).to receive(:set_shipping_and_billing_address)
  #   #   get :new
  #   # end
  #   #
  #   # context 'if session[:order_id]' do
  #   #   let(:order) { FactoryGirl.build(:order) }
  #   #
  #   #   before { session[:order_id] = order.id }
  #   #
  #   #   it 'sets @order' do
  #   #     expect(controller.instance_variable_get(:@order)).not_to be_nil
  #   #     get :new
  #   #   end
  #   #
  #   #   it 'sets @user' do
  #   #     expect(controller.instance_variable_get(:@user)).not_to be_nil
  #   #     get :new
  #   #   end
  #   # end
  # end
  #
  # describe 'POST #create' do
  #   context 'with valid params' do
  #     it 'creates a new Checkout' do
  #       expect do
  #         post :create
  #       end.to change(Order, :count).by(1)
  #     end
  #
  #     it 'redirects to the created review' do
  #       post :create
  #       expect(response).to redirect_to(checkout_complete_path)
  #     end
  #   end
  # end
end
