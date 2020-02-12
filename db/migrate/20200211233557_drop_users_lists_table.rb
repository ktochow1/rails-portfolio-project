class DropUsersListsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :lists_users
  end
end
