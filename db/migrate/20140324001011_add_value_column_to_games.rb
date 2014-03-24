class AddValueColumnToGames < ActiveRecord::Migration
  def change
    add_column :games, :value, :integer
  end
end
