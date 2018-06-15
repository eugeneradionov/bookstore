class AddUserToCart < ActiveRecord::Migration[5.1]
  def change
    change_table :carts do |t|
      t.integer :user_id
    end
  end
end
