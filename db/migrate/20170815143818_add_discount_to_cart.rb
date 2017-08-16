class AddDiscountToCart < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :discount, :decimal
  end
end
