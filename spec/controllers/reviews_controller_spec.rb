# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  before do
    @book = FactoryGirl.create(:book)
    @user = FactoryGirl.create(:user)
    @review_status = FactoryGirl.create(:review_status)
  end

  let(:valid_attributes) do
    { book_id: @book.id,
      title: FFaker::Lorem.phrase,
      text: FFaker::Lorem.paragraph,
      user_id: @user.id,
      rating: 4 }
  end

  describe 'POST #create' do
    it 'creates a new Review' do
      expect do
        post :create, params: { review: valid_attributes }
      end.to change(Review, :count).by(1)
    end

    it 'redirects to the book' do
      post :create, params: { review: valid_attributes }
      expect(response).to redirect_to(@book)
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested review' do
      review = Review.new valid_attributes
      review.review_status = @review_status
      review.save

      expect do
        delete :destroy, params: { id: review.to_param }
      end.to change(Review, :count).by(-1)
    end

    it 'redirects to the reviews list' do
      review = Review.new valid_attributes
      review.review_status = @review_status
      review.save

      delete :destroy, params: { id: review.to_param }
      expect(response).to redirect_to(reviews_url)
    end
  end
end
