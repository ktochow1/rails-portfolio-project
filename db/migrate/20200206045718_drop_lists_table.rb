class DropListsTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :lists
  end
end
