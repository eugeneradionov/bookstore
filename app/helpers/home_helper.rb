module HomeHelper
  def book_first_sentence(book)
    book.description[/^(.*?)[.?!]/]
  end
end