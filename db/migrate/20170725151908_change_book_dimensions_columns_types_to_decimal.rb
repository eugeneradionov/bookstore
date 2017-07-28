class ChangeBookDimensionsColumnsTypesToDecimal < ActiveRecord::Migration[5.1]
  def up
    change_table :books do |t|
      t.change :height, :decimal
      t.change :weight, :decimal
      t.change :depth, :decimal
    end
  end

  def down
    change_table :books do |t|
      t.change :height, :integer
      t.change :weight, :integer
      t.change :depth, :integer
    end
  end
end
