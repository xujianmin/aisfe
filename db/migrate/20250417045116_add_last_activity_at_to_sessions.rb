class AddLastActivityAtToSessions < ActiveRecord::Migration[8.0]
  def change
    add_column :sessions, :last_activity_at, :datetime
  end
end
