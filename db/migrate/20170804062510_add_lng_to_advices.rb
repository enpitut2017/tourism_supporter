class AddLngToAdvices < ActiveRecord::Migration[5.1]
  def change
    add_column :advices, :lng, :float
  end
end
