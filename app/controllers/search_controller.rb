class SearchController < ApplicationController
	def new
		@games = Game.search(params[:search])
		respond do |format|
			format.js
		end
	end
end
