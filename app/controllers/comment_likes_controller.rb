class CommentLikesController < ApplicationController
  def create
    @comment_like = current_user.comment_likes.build(comment_id: params[:comment_id])
    @comment_like.save
  end

  def destroy
    @comment_like = CommentLike.find(params[:id])
    @comment_like.destroy
  end
end