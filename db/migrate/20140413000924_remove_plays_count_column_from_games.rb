class RemovePlaysCountColumnFromGames < ActiveRecord::Migration
  def up
  	remove_column :games, :play_count
  end

  def down
  	add_column :games, :play_count, :integer
  end
end
