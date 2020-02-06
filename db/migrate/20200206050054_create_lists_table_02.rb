class CreateListsTable02 < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :title
      t.integer :user_id
      t.string :status 
    end
  end
end
