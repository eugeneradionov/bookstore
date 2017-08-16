class ChangeCardNumberToStringInPayments < ActiveRecord::Migration[5.1]
  def up
    change_column :payments, :card_number, :string
  end

  def down
    change_column :payments, :card_number, :integer
  end
end
