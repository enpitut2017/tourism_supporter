class CreateAdvices < ActiveRecord::Migration[5.1]
  def change
    create_table :advices do |t|
      t.references :spot, foreign_key: true
      t.string :pictureURL
      t.text :comment

      t.timestamps
    end
  end
end
