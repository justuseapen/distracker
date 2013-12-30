class CreateSeshes < ActiveRecord::Migration
  def up
    create_table :seshes do |t|
      t.string :name, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
  def down
  	drop_table :seshes
  end
end
