class AddDetailCommentToSpots < ActiveRecord::Migration[5.1]
  def change
    add_column :spots, :detail_comment, :text
  end
end
