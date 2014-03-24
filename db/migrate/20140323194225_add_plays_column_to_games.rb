class AddPlaysColumnToGames < ActiveRecord::Migration
  def change
    add_column :games, :plays, :integer, default: 0
  end
end
