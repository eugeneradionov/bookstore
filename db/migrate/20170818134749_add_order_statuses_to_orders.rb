class AddOrderStatusesToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :order_statuses, foreign_key: true
  end
end
