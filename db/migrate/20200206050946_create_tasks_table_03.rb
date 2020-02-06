class CreateTasksTable03 < ActiveRecord::Migration[5.2]
  def up
    create_table :tasks do |t|
      t.string :task_status
      t.string :content
      t.integer :list_id
      t.integer :user_id
    end
  end

  def down
    IrreversibleMigration
  end
end
