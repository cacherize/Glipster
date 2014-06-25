class SupportTicketsController < ApplicationController
  def new
    @support_ticket = SupportTicket.new

    if params[:game].present?
      @game = Game.find(params[:game])
    end
  end

  def create
    @support_ticket = SupportTicket.new(params[:support_ticket])
    browser = Browser.new(:accept_language => "en-us")

    @support_ticket.browser_version = "#{browser.name}-#{browser.full_version}"

    if params[:support_ticket][:game_id].present?
      @game = Game.find(params[:support_ticket][:game_id])
    end

    respond_to do |format|
      if @support_ticket.save
        format.html{redirect_to root_path, notice: @support_ticket.success_message}
      else
        format.html{render :new}
      end
    end
  end
end