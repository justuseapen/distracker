class CreateSessions < ActiveRecord::Migration
  def up
    create_table :sessions do |t|
      t.string :name, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
  def down
  	drop_table :sessions
  end
end
