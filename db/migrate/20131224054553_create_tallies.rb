class CreateTallies < ActiveRecord::Migration
  def up
    create_table :tallies do |t|
    	t.integer :session_id

      t.timestamps
    end
  end
  def down
  	drop_table :tallies
  end
end
