class HomeController < ApplicationController
  helper_method :book_first_sentence

  def index
    @books = Book.order(created_at: :desc).limit(3)
    @first_book = @books.first
    @books = @books.reject { |book| book == @first_book }
    @bestsellers = bestsellers
  end

  private

  def book_first_sentence(book)
    book.description[/^(.*?)[.?!]/]
  end

  def bestsellers
    books_orders_count = OrderItem.where('order_id IS NOT NULL').group(:book_id)
                             .order('count_all DESC').limit(4).count()

    bestsellers = []
    books_orders_count.each_key do |key|
      bestsellers << Book.find(key)
    end
    bestsellers
  end
end
