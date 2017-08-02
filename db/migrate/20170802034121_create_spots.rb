class CreateSpots < ActiveRecord::Migration[5.1]
  def change
    create_table :spots do |t|
      t.string :placeName
      t.integer :lat
      t.integer :lng

      t.timestamps
    end
  end
end
