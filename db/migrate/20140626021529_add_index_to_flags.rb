class AddIndexToFlags < ActiveRecord::Migration
  def change
    add_index :flags, [:user_id, :game_id], unique: true
  end
end
