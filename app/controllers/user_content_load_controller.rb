class UserContentLoadController < ApplicationController
  def likes
    user = User.find_by_username(params[:id])
    @all_likes = user.
      reputations.
      positive_reps.
      order('created_at DESC').
      paginate(per_page: 8, page: params[:likes])

    respond_to do |format|
      format.js
    end
  end

  def recents
    user = User.find_by_username(params[:id])
    @all_recents = user.
      game_users.
      order('created_at DESC').
      paginate(per_page: 8, page: params[:recents])

    respond_to do |format|
      format.js
    end
  end
end
