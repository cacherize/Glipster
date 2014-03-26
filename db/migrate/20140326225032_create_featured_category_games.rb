class CreateFeaturedCategoryGames < ActiveRecord::Migration
  def change
    create_table :featured_category_games do |t|
    	t.belongs_to :category
    	t.belongs_to :game
      t.timestamps
    end
  end
end
