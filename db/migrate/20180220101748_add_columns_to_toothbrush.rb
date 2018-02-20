class AddColumnsToToothbrush < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :starting_on, :date
    add_column :bookings, :ending_on, :date
    add_column :bookings, :status, :string
  end
end
