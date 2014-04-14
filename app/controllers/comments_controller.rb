class CommentsController < ApplicationController
	before_filter :authenticate
	def create
		@comment = Comment.new(params[:comment])
		@comment.user_id = current_user.id

		respond_to do |format|
			if @comment.save
				format.html {redirect_to game_path(@comment.game, anchor: "comments"), notice: "Successfully submitted comment!"}
			else
				format.html {redirect_to @comment.game, alert: "Unable to post comment, please try again."}
			end
		end			
	end

	def destroy
		@comment = Comment.find(params[:id])

		respond_to do |format|
			if @comment.destroy
				format.html{redirect_to game_path(@comment.game, anchor: 'comments'), notice: "Successfully removed comment!"}
			else
				format.html{redirect_to @comment.game, alert: "Unable to delete comment, please try again."}
			end
		end
	end
end
