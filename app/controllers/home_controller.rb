class HomeController < ApplicationController
  helper_method :book_first_sentence

  def index
    @books = Book.order(created_at: :desc).limit(3)
    @first_book = @books.first
    @books = @books.reject { |book| book == @first_book }
  end

  private

  def book_first_sentence(book)
    book.description[/^(.*?)[.?!]/]
  end
end
