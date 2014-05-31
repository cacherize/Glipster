class Recommendation < ActiveRecord::Base
  attr_accessible :game_id, :recommendation_id
  belongs_to :game, foreign_key: 'game_id'
  belongs_to :recommend, class_name: 'Game', foreign_key: 'recommendation_id'

  def self.generate_game_recommendations
    games = Game.all
    games.each do |game|
      game_list = game.find_recommendations
      unless game_list == false
        game.recommendations.destroy_all
        game_list.each {|g| game.recommendations.create(recommendation_id: g.id)}
      end
    end
  end
end
