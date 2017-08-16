class CreateUserInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :user_infos do |t|
      t.references :user, foreign_key: true
      t.references :shipping_address
      t.references :billing_address
      t.references :payment

      t.timestamps
    end
  end
end
