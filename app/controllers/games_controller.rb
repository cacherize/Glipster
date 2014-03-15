class GamesController < ApplicationController
	def new
		@game = Game.new
	end

	def create
		@game = Game.new(param[:id])

		respond_to do |format|
			if @game.save
				format.html{redirect_to @game}
			else
				format.html{render :new}
			end
		end
	end

	def upload
		@uploader = Game.new.flash_file
		@uploader.success_action_redirect = new_game_url
	end
end
