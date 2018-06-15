class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :cart, foreign_key: true
      t.references :delivery

      t.timestamps
    end
  end
end
