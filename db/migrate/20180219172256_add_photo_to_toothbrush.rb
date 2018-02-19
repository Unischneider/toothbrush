class AddPhotoToToothbrush < ActiveRecord::Migration[5.1]
  def change
    add_column :toothbrushes, :photo, :string
  end
end
