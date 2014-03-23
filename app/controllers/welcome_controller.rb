class WelcomeController < ApplicationController
  def index
  	@games = Game.find(:all)
  	@new_games = @games.last(12)
  	@random_games = [Game.offset(rand(Game.count)).first] if @games.present?
  end
end
