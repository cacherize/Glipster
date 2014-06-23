class WelcomeController < ApplicationController
  def index
  	@featured = Game.where(featured: true)
  	@new_games = Game.order('id DESC').last(12)
  	@random_game = [Game.first(:offset => rand(Game.count))]
    @images = FeaturedImage.all
  end
end
