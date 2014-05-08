class SupportTicketsController < ApplicationController
  def new
    @support_ticket = SupportTicket.new
  end

  def create
    @support_ticket = SupportTicket.new(params[:support_ticket])

    respond_to do |format|
      if @support_ticket.save
        format.html{redirect_to root_path, notice: @support_ticket.success_message}
      else
        format.html{render :new}
      end
    end
  end
end