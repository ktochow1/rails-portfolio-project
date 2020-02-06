class DropListsTable02 < ActiveRecord::Migration[5.2]
  def up
    drop_table :lists
  end

  def down
    raise IrreversibleMigration
  end
end
