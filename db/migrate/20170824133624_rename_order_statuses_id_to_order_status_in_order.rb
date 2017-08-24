class RenameOrderStatusesIdToOrderStatusInOrder < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :order_statuses_id, :order_status_id
  end
end
