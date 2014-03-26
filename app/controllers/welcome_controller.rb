class WelcomeController < ApplicationController
  def index
  	@featured = Game.where(featured: true)
  	@new_games = Game.last(12)
  	@random_game = [Game.offset(rand(Game.count)).first]
  end
end
