class CreateDistractions < ActiveRecord::Migration
  def up
    create_table :distractions do |t|
      t.integer :sesh_id, null: false

      t.timestamps
    end
  end
  def down
  	drop_table :distractions
  end

end
