class AddLikesCount < ActiveRecord::Migration[5.1]
  def change
    add_column :advices, :likes_count, :integer, default: 0, null: false
  end
end
