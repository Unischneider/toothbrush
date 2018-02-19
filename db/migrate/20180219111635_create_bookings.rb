class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :toothbrush, foreign_key: true
      t.integer :total_price
      t.integer :days

      t.timestamps
    end
  end
end
