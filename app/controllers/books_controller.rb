class BooksController < ApplicationController
  load_and_authorize_resource

  # GET /books
  def index
    @books = filter_by_category
    @books = sort_by_criteria_and_direction

    @categories_and_count = Book.categories_and_count

    respond_to do |format|
      format.html { @books }
      format.js { @books }
    end
  end

  # GET /books/1
  def show
    @order_item = OrderItem.new
    @review = Review.new
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_params
    params.require(:book).permit(:title, :description, :publication_year,
                                 :price, :height, :weight, :depth, :sort,
                                 :direction, author_ids: [])
  end

  def sort_by_criteria_and_direction
    sort = params[:sort] || :created_at
    direction = params[:direction] || :desc
    page = (params[:page] || '1').to_i

    begin
      @books.order("#{sort}" => "#{direction}").page(page)
    rescue NoMethodError
      Book.order("#{sort}" => "#{direction}").page(page)
    end
  end

  def filter_by_category
    category = params[:category]
    Book.joins(:categories).where('categories.name LIKE (?)', category) if category
  end
end
