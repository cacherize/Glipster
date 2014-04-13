class WelcomeController < ApplicationController
  def index
  	@featured = Game.where(featured: true)
  	@all_games = Game.all
  	@new_games = @all_games.last(12)
  	@random_game = [@all_games.sample]
  end
end
