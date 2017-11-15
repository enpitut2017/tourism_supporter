class RemovePictureToSpot < ActiveRecord::Migration[5.1]
  def change
    remove_column :spots, :picture, :string
  end
end
