class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.string :title
    	t.text :description
    	t.string :controls
    	t.integer :play_count
      t.timestamps
    end
  end
end
