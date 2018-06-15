class AddShippingAndBillingAddressesToOrder < ActiveRecord::Migration[5.1]
  def change
    change_table :orders do |t|
      t.references :shipping_address
      t.references :billing_address
    end
  end
end
