class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.integer :publication_year
      t.decimal :price
      t.integer :height
      t.integer :weight
      t.integer :depth

      t.timestamps
    end
  end
end
