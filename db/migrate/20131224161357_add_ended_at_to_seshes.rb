class AddEndedAtToSeshes < ActiveRecord::Migration
  def up
    add_column :seshes, :ended_at, :datetime
  end
  def down
  	remove_column :seshes, :ended_at
  end
end
