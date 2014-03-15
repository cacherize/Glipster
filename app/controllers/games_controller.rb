class GamesController < ApplicationController
	def new
		@game = Game.new(key: params[:key])
	end

	def create
		@game = Game.new(params[:game])

		respond_to do |format|
			if @game.save
				format.html{redirect_to @game}
			else
				format.html{render :new}
			end
		end
	end

	def show
		@game = Game.find(params[:id])
	end

	def upload
		@uploader = Game.new.flash_file
		@uploader.success_action_redirect = new_game_url
	end
end
