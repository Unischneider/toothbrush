class AddColumnsReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :rating, :integer
    add_reference :reviews, :booking, foreign_key: true
  end
end
