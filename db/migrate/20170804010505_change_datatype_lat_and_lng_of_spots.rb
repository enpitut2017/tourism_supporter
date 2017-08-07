class ChangeDatatypeLatAndLngOfSpots < ActiveRecord::Migration[5.1]
  def change
    change_column :spots, :lat, :float
    change_column :spots, :lng, :float
    change_column :spots, :picture, :string, :null => false
  end
end
