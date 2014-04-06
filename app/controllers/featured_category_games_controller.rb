class FeaturedCategoryGamesController < ApplicationController
	def index
		featured_games = FeaturedCategoryGame.all
		@games = featured_games.group_by{|game| game.category.name }.sort
	end

	def show
		@category = Category.find(params[:id])
		@games = @category.games.order('created_at desc')
		@featured_games = @category.featured_category_games
	end

	def create
		@featured_game = FeaturedCategoryGame.new(params[:object])
		respond_to do |format|
			if @featured_game.save
				format.html{redirect_to featured_category_game_path(@featured_game.category), notice: 'Successfully saved!'}
			else
				format.html{redirect_to featured_category_game_path(@featured_game.category), alert: 'Unable to save.'}
			end
		end
	end

	def destroy
		@featured_game = FeaturedCategoryGame.find(params[:id])
		@featured_game.destroy
		respond_to do |format|
			format.html{redirect_to featured_category_game_path(@featured_game.category), notice: 'Successfully deleted!'}
		end
	end
end
