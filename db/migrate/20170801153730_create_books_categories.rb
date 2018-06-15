class CreateBooksCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :books_categories, id: false do |t|
      t.belongs_to :category, index: true
      t.belongs_to :book, index: true
    end
  end
end
