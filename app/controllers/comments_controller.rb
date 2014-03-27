class CommentsController < ApplicationController
	def create
		@comment = Comment.new(params[:comment])
		@comment.user_id = current_user.id
		@comment.save

		respond_to do |format|
			format.html {redirect_to @comment.game}
		end			
	end
end
