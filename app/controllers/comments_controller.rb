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
end
