class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.belongs_to :game
      t.belongs_to :recommendation
      t.timestamps
    end
  end
end
