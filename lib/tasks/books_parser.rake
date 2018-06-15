namespace :books_parser do
  desc 'Parse and save books from online shop to books table in DB'
  task parse: :environment do
    require_relative 'books_parser/parser'

    url = 'books-online/non-fiction/computing-i-t-/computer-programming-software-development/web-programming/cUMW-p1.html'
    urls_list = Parser.new.parse_list(url)

    urls_list.each do |url|
      puts "Parsing #{Parser::BASEURL + url}"
      Parser.new.parse_book(url)
    end

  end

end
