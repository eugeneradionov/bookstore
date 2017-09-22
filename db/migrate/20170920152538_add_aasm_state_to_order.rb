class AddAasmStateToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :aasm_state, :string
  end
end
