class AddApprovedToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :approved, :boolean, default: false
  end
end
