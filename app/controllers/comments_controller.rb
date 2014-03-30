class CommentsController < ApplicationController
	before_filter :authorize
	def create
		@comment = Comment.new(params[:comment])
		@comment.user_id = current_user.id
		@comment.save

		respond_to do |format|
			format.html {redirect_to @comment.game, notice: "Successfully submitted comment!"}
		end			
	end

	def destroy
		@comment = Comment.find(params[:id])

		respond_to do |format|
			if @comment.destroy
				format.html{redirect_to @comment.game, notice: "Successfully removed comment!"}
			else
				format.html{redirect_to @comment.game, alert: "Unable to delete comment, please try again."}
			end
		end
	end
end
