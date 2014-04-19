class AddDailyPlayColumnToGames < ActiveRecord::Migration
  def change
    add_column :games, :daily_plays, :integer
  end
end
