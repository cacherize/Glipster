class AddWidthAndHeightColumnToGames < ActiveRecord::Migration
  def change
    add_column :games, :width, :integer
    add_column :games, :height, :integer
  end
end
