class AddUserColumn < ActiveRecord::Migration[5.1]
  def change
    add_reference :advices, :user
    add_reference :spots, :create_user
  end
end
