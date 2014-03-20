class WelcomeController < ApplicationController
  def index
  	@games = Game.find(:all)
  end
end
