class RemoveApprovedFromReview < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :approved
  end
end
