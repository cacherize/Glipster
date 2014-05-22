class MostPlayedController < ApplicationController
  def show
    if params[:id] == "25"
      @quantity = 25
    elsif params[:id] == "50"
      @quantity = 50
    elsif params[:id] == "100"
      @quantity = 100
    end
    if @quantity
      @daily_games = Game.find(:all, order: 'daily_plays desc', limit: @quantity)
      @weekly_games = Game.find(:all, order: 'weekly_plays desc', limit: @quantity)
      @monthly_games = Game.find(:all, order: 'monthly_plays desc', limit: @quantity)
      @all_top_games = Game.find(:all, order: 'plays desc', limit: @quantity)
    end
  end
end
