class GameCategory < ActiveRecord::Base
  attr_accessible :game_id, :category_id
  belongs_to :game
  belongs_to :category
end
