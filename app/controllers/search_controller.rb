class SearchController < ApplicationController
	def new
		@games = Game.search(params[:search]).paginate(per_page: 15, page: params[:page])
	end

	def games
		@games = Game.search(params[:term]).map(&:title)
		render json: @games
	end
end
