class AddFeaturedColumnToGames < ActiveRecord::Migration
  def change
    add_column :games, :featured, :boolean
  end
end
