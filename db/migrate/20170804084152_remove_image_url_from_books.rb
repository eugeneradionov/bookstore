class RemoveImageUrlFromBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :image_url
  end
end
