class CreateToothbrushes < ActiveRecord::Migration[5.1]
  def change
    create_table :toothbrushes do |t|
      t.integer :uses
      t.integer :age
      t.integer :people
      t.string :material
      t.integer :brush_strength
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
