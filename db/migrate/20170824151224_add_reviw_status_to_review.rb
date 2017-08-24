class AddReviwStatusToReview < ActiveRecord::Migration[5.1]
  def change
    change_table :reviews do |t|
      t.references :review_status, foreign_key: true, index: true
    end
  end
end
