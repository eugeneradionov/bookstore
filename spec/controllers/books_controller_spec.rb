# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:book) { FactoryGirl.create(:book) }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_success
    end

    it 'assigns @books' do
      get :index
      expect(assigns(:books)).not_to be_nil
    end

    it 'assigns @categories_and_count' do
      get :index
      expect(assigns(:categories_and_count)).to be_a(PG::Result)
    end

    it 'renders :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: book.to_param }
      expect(response).to be_success
    end

    it 'assigns @order_item' do
      get :show, params: { id: book.to_param }
      expect(assigns(:order_item)).to be_a(OrderItem)
    end

    it 'assigns @review' do
      get :show, params: { id: book.to_param }
      expect(assigns(:review)).to be_a(Review)
    end
  end
end
