class AddUseBillingAddressToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :use_billing_address, :string
  end
end
