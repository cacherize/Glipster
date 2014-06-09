class SearchController < ApplicationController
	def new
		@games = Game.search(params[:search]).paginate(per_page: 15, page: params[:page])
	end

	def index
		@games = Game.search(params[:term])
		@games = @games.map{|game| game.to_autocomplete_hash }

		render json: @games
	end
end
