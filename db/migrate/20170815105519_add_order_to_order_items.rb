class AddOrderToOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :order_items, :order
  end
end
