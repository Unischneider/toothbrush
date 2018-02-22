class RemoveToothbrushIdFromReviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :toothbrush_id
  end
end
