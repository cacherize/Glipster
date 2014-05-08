class SupportTicketsController < ApplicationController
  def new
    @support_ticket = SupportTicket.new
  end
end