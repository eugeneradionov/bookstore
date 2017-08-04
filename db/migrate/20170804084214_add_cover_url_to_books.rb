class AddCoverUrlToBooks < ActiveRecord::Migration[5.1]
  def change
    change_table :books do |t|
      t.text :cover_url
    end
  end
end
