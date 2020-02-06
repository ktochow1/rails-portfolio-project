class RemoveListidFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :list_id, :integer
  end
end
