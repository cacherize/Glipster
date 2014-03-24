class MoveValueColumnFromGamesToReputation < ActiveRecord::Migration
  def up
  	remove_column :games, :value
  	add_column :reputations, :value, :integer
  end

  def down
  	add_column :games, :value, :integer
  	remove_column :reputations, :value
  end
end
