class GameSequelsController < ApplicationController
  def index
    @sequel = Game.find(params[:id])

    respond_to do |format|
      format.js
    end
  end
end
