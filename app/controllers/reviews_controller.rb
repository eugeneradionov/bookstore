class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy]

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.review_status = ReviewStatus.find_by(status: 'Unprocessed')

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review.book, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { redirect_to request.referer }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    params.fetch(:review, {}).permit(:title, :text, :user_id,
                                                :book_id, :rating)
  end
end
