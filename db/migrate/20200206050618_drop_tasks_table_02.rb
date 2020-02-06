class DropTasksTable02 < ActiveRecord::Migration[5.2]
  def up
    drop_table :tasks
  end

  def down
    raise IrreversibleMigration
  end
end
