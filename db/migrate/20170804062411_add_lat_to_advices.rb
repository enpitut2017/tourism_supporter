class AddLatToAdvices < ActiveRecord::Migration[5.1]
  def change
    add_column :advices, :lat, :float
  end
end
