class RemoveListAndUserIdsFromListAndUserTables < ActiveRecord::Migration[5.2]
  def change
    remove_column :lists, :user_id, :integer
    remove_column :users, :list_id, :integer
  end
end
