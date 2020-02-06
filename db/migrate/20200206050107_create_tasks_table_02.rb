class CreateTasksTable02 < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :task_status
      t.string :content
      t.integer :list_id
      t.integer :user_id
    end
  end
end
