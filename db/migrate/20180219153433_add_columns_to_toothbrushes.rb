class AddColumnsToToothbrushes < ActiveRecord::Migration[5.1]
  def change
    add_column :toothbrushes, :name, :string
    add_column :toothbrushes, :description, :text
    add_column :toothbrushes, :availability, :boolean, default: true
  end
end
