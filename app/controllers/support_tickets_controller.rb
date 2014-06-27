class SupportTicketsController < ApplicationController
  def index
    @support_tickets = SupportTicketSearch.new(params[:support_ticket_search]).results
  end

  def new
    @support_ticket = SupportTicket.new

    if params[:game].present?
      @game = Game.find(params[:game])
    end
  end

  def update
    @support_ticket = SupportTicket.find(params[:id])

    @support_ticket.update_attributes(params[:support_ticket])
    respond_to do |format|
      format.all { render :nothing => true, :status => 200 }
    end
  end

  def create
    @support_ticket = SupportTicket.new(params[:support_ticket])
    @support_ticket.browser_version = request.user_agent

    if params[:support_ticket][:game_id].present?
      @game = Game.find(params[:support_ticket][:game_id])
    end

    @support_ticket.check_existing_tickets(request.remote_ip)

    @support_ticket.requester = request.remote_ip

    respond_to do |format|
      if @support_ticket.errors.blank? && @support_ticket.save
        format.html{redirect_to root_path, notice: @support_ticket.success_message}
      else
        format.html{render :new}
      end
    end
  end
end