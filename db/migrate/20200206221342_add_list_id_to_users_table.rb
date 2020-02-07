class AddListIdToUsersTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :list_id, :integer
  end
end
