class CreateDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :deliveries do |t|
      t.string :method
      t.integer :days_from
      t.integer :days_to
      t.decimal :price

      t.timestamps
    end
  end
end
