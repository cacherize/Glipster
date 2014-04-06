class FeaturedCategoryGamesController < ApplicationController
	def index
		featured_games = FeaturedCategoryGame.all
		@games = featured_games.group_by{|game| game.category.name }.sort
	end

	def show
		@category = Category.find(params[:id])
		@games = @category.games.search(params[:search]).order('created_at desc').paginate(per_page: 10, page: params[:page])
		@featured_games = Game.find(@category.featured_category_games_ids)
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
