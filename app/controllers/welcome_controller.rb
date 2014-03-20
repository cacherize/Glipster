class WelcomeController < ApplicationController
  def index
  	@games = Game.find(:all)
  	@random_games = Game.offset(rand(Game.count)).last(12)
  end
end
