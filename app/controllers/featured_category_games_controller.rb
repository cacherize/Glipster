class FeaturedCategoryGamesController < ApplicationController
	def index
		featured_games = FeaturedCategoryGame.all
		@games = featured_games.group_by{|game| game.category.name }.sort
	end

	def show
		@category = Category.find(params[:id])
		@games = @category.games
		@featured_games = @category.featured_category_games
	end
end
