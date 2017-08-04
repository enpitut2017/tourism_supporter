class RenamePictureUrlColumnToAdvices < ActiveRecord::Migration[5.1]
  def change
    rename_column :advices, :pictureURL, :picture
  end
end
