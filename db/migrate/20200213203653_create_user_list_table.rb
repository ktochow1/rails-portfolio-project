class CreateUserListTable < ActiveRecord::Migration[5.2]
  def change
    create_table :project_assignments do |t|
      t.integer :user_id
      t.integer :list_id
      t.datetime :created_at, null: false
      t.string :location
    end
  end
end
