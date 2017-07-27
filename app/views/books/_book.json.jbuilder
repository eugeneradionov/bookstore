json.extract! book, :id, :title, :description, :publication_year, :price, :height, :weight, :depth, :created_at, :updated_at
json.url book_url(book, format: :json)
