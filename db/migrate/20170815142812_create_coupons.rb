class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.string :code
      t.decimal :discount
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
