class DropUsersTable02 < ActiveRecord::Migration[5.2]
  def up
    drop_table :users
  end

  def down
    raise IrreversibleMigration
  end
end
