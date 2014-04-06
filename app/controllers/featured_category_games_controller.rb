class FeaturedCategoryGamesController < ApplicationController
	def index
		featured_games = FeaturedCategoryGame.all
		@games = featured_games.group_by{|game| game.category.name }.sort
	end

	def edit
		@category = Category.find(params[:id])
		@games = @category.games
	end
end
