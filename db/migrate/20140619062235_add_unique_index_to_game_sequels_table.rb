class AddUniqueIndexToGameSequelsTable < ActiveRecord::Migration
  def change
    add_index :game_sequels, [:sequel_id, :game_id], unique: true
  end
end
