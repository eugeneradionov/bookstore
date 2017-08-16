class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :card_number
      t.string :name_on_card
      t.string :mm_yy
      t.integer :cvv, limit: 4

      t.timestamps
    end
  end
end
