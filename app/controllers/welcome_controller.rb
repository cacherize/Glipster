class WelcomeController < ApplicationController
  def index
  	@games = Game.find(:all)
  	@recent_games = @games.last(12)
  	@random_games = [Game.offset(rand(Game.count)).first]
  end
end
