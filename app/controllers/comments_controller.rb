class CommentsController < ApplicationController
	before_filter :authenticate
	def create
    comments = current_user.comments
    if comments.length > 10
      timer = 5.minutes.ago - comments[10].created_at
    else
      timer = 0
    end

    @comment = current_user.add_comment(params[:comment])
    unless timer >= 0
      countdown = (-timer/60).ceil
      redirect_to(game_path(@comment.game), alert: "You must wait #{countdown} more minutes to post a comment.")
      return
    end

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
