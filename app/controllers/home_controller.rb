class HomeController < ApplicationController

  def index
    @books = Book.order(created_at: :desc).limit(3)
    @first_book = @books.first
    @books = @books.reject { |book| book == @first_book }
    @bestsellers = bestsellers
  end

  private

  def bestsellers
    books_orders_count = OrderItem.where('order_id IS NOT NULL').group(:book_id)
                                  .order('sum("order_items"."quantity") DESC')
                                  .limit(4).count

    bestsellers = []
    books_orders_count.each_key do |key|
      bestsellers << Book.find(key)
    end
    bestsellers
  end
end
