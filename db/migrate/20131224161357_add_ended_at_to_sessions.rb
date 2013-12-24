class AddEndedAtToSessions < ActiveRecord::Migration
  def up
    add_column :sessions, :ended_at, :datetime
  end
  def down
  	remove_column :sessions, :ended_at
  end
end
