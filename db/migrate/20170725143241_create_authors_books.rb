class CreateAuthorsBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :authors_books do |t|
      t.references :author, foreign_key: true, index: true
      t.references :book, foreign_key: true, index: true
    end
    add_index :authors_books, [:author_id, :book_id]
  end
end
