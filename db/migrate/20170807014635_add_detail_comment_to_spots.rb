class AddDetailCommentToSpots < ActiveRecord::Migration[5.1]
  def change
    add_column :spots, :detailComment, :text
  end
end
