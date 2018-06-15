class RenameWeightToWidthInBooks < ActiveRecord::Migration[5.1]
  def change
    rename_column :books, :weight, :width
  end
end
