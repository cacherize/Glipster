class FeaturedCategoryGame < ActiveRecord::Base
  attr_accessible :game_id, :category_id
  belongs_to :category
  belongs_to :game
end
