class HomeController < ApplicationController

  def index
    @books = Book.order(created_at: :desc).limit(3)
    @first_book = @books.first
    @books = @books.reject { |book| book == @first_book }
    @bestsellers = Book.bestsellers
  end
end
