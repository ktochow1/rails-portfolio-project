class CreateListsTable03 < ActiveRecord::Migration[5.2]
  def up
    create_table :lists do |t|
      t.string :title
      t.integer :user_id
      t.string :status
    end
  end

  def down
    IrreversibleMigration
  end
end
