class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.string :name
      t.text :description
      t.string :address
      t.integer :longitude
      t.integer :latitude
      t.date :start_time
      t.date :end_time
      t.integer :price
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
