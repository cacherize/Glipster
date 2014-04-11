class SearchController < ApplicationController
	def new
		@games = Game.search(params[:search]).paginate(per_page: 15, page: params[:page])
	end
end
