class FlagsController < ApplicationController
  def create
    @flag = Flag.new(user_id: current_user.id, game_id: params[:id])

    respond_to do |format|
      if @flag.save
        format.js
      end
    end
  end
end
