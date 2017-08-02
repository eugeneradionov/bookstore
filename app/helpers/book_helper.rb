module BookHelper
  def book_price(book)
    "€#{book.price}"
  end

  def book_dimensions
    "H:#{@book.height}\" x W:#{@book.width}\" x D:#{@book.depth}\""
  end
end
