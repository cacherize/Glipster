class GameSequelsController < ApplicationController
  def index
    @sequel = Game.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def update
    @game = Game.find(params[:id])
    params[:positions].each do |k,v|
      sequel = GameSequel.find(k)
      sequel.update_attribute(:position, v)
    end

    respond_to do |format|
      format.html{redirect_to @game, notice: "Successfully updated sequel positions!"}
    end
  end
end
