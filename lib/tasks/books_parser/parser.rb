class Parser
  BASEURL = 'https://www.booktopia.com.au/'
  USD_TO_EUR = 0.84
  require 'nokogiri'

  def parse_list(url)
    book_urls = []
    page = Nokogiri::HTML(open(BASEURL + url))
    page.css('ul#product-browse').css('div.product').each do |product|
      book_url = product.css('div.image')&.css('a')&.attr('href')&.text.sub('/', '')
      book_urls << book_url
    end
    book_urls
  end

  def parse_book(url)
    page = Nokogiri::HTML(open(BASEURL + url))

    book = Book.new
    book.title = page.css('div#product-title h1')&.text
    book.price = (page.css('div.prices')&.css('div.sale-price')&.first&.text&.gsub(/\$/,'')&.to_f * USD_TO_EUR).round(2)
    book.description = page.css('div#description p:not(#google-preview-information)')&.text
    book.publication_year = page.css('#details-summary').text[/\d{4}/].to_i

    # dimensions
    details = page.css('div#details').text
    matched_groups = details[/Dimensions.+\s+.+/].split(':').last.gsub(' ', '').gsub("&nbsp;", '').split('x')
    book.height = matched_groups[0][/\d+\.\d{,2}/]
    book.width = matched_groups[1][/\d+\.\d{,2}/]
    book.depth = matched_groups[2][/\d+\.\d{,2}/]

    # authors
    page.css('div#contributors a').each do |author|
      book.authors << [Author.find_or_create_by(name: author.text)]
    end

    # category = page.css('div#breadcrumbs')&.css('a')[-1]&.text
    category = 'Web Development'
    book.categories << [Category.find_by(name: category)]
    category = 'Web Design'
    book.categories << [Category.find_by(name: category)]

    # book.image_urls << [ImageUrl.create(url: page.css('#image img')&.attr('src').text.strip)]
    book.cover_url = page.css('#image img')&.attr('src').text.strip
    book.save
  end
end
