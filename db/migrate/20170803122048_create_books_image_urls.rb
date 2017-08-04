class CreateBooksImageUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :books_image_urls do |t|
      t.belongs_to :book, index: true
      t.belongs_to :image_url, index: true
    end
  end
end
