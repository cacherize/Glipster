class GamesController < ApplicationController
	def new
		redirect_to games_upload_url if params[:key].nil?
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
		@developer = @game.developer
	end

	def upload
		@uploader = Game.new.flash_file
		@uploader.success_action_redirect = new_game_url
	end

	def edit 
		@game = Game.find(params[:id])
	end

	def update
		@game = Game.find(params[:id])
		respond_to do |format|
			if @game.update_attributes(params[:game])
				format.html{redirect_to @game, notice: 'Successfully updated game!'}
			else
				format.html{render :edit}
			end
		end
	end
end
