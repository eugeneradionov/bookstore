module BookHelper
  def book_price(book)
    "€#{book.price}"
  end

  def book_dimensions
    "H:#{@book.height}\" x W:#{@book.width}\" x D:#{@book.depth}\""
  end

  def book_gallery_image(id)
    begin
      @book.image_urls[id].url
    rescue NoMethodError
      @book.cover_url
    end
  end
end
