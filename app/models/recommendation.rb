class Recommendation < ActiveRecord::Base
  attr_accessible :game_id, :recommendation_id
  belongs_to :game
  belongs_to :recommendation, class_name: 'game'
end
