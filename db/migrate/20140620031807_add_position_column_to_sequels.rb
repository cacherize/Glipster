class AddPositionColumnToSequels < ActiveRecord::Migration
  def change
    add_column :game_sequels, :position, :integer, default: 0
  end
end
