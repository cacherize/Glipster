class GamesController < ApplicationController
  before_filter :authorize, only: :vote
  skip_filter :store_location, only: [:render_reputation_partial, :vote]
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
		if cookies[:viewed_games].present?
			viewed_games = JSON.parse(cookies[:viewed_games])
    	unless viewed_games.include?(@game.id)
      	viewed_games = viewed_games << @game.id
        cookies[:viewed_games] = {value: JSON.generate(viewed_games)}
        @game.increment!(:plays)
	    end
    else
	    cookies[:viewed_games] = {value: JSON.generate([@game.id])}
	    @game.increment!(:plays)
    end
		@developer = @game.developer
		@categories = @game.categories
		@comment = Comment.new
	end

	def load_comments
		@game = Game.find(params[:id])
		games_comments = @game.comments
		@comments = games_comments.paginate(per_page: 10, page: params[:page]) if games_comments
		respond_to do |format|
			format.js
		end
	end

	def vote
    value = params[:value] == "-1" ? -1 : 1
    @game = Game.find(params[:id])
    @game.create_or_update_reputation(value, current_user)
    reps = @game.reputations
    @rep_percents = @game.generate_reputation_percentages(reps) if reps.present?
    respond_to do |format|
    	if request.referer.include?("login")
    		format.html {redirect_to @game, notice: "Thank you for voting!"}
    	else
    		format.js
    	end
    end
	end

	def load_reputation
		@game = Game.find(params[:id])
    reps = @game.reputations
    @rep_percents = @game.generate_reputation_percentages(reps) if reps.present?
    respond_to do |format|
    	format.js
    end
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
