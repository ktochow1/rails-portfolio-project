class RemoveUseridAndListidFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :user_id, :integer
    remove_column :tasks, :list_id, :integer
  end
end
