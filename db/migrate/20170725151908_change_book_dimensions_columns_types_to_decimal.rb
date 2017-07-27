class ChangeBookDimensionsColumnsTypesToDecimal < ActiveRecord::Migration[5.1]
  def change
    change_table :books do |t|
      t.change :height, :decimal
      t.change :weight, :decimal
      t.change :depth, :decimal
    end
  end
end
