class RemoveCartReferencesFromOrderItems < ActiveRecord::Migration[5.1]
  def up
    remove_column :order_items, :cart_id
    add_reference :order_items, :cart
  end

  def down
    remove_column :order_items, :cart_id
    add_reference :order_items, :cart, foreign_key: true
  end
end
