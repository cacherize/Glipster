class CommentsController < ApplicationController
	def create
		@comment = Comment.new(params[:comment])
		@comment.save

		respond_to do |format|
			format.js
		end			
	end
end
