class CreateMylists < ActiveRecord::Migration[5.1]
  def change
    create_table :mylists do |t|
      t.references :spot, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
