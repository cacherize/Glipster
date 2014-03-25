class CreateGameCategories < ActiveRecord::Migration
  def change
    create_table :game_categories do |t|
    	t.belongs_to :game
    	t.belongs_to :category
      t.timestamps
    end
  end
end
