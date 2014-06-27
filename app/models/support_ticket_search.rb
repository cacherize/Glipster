class SupportTicketSearch
  def initialize(params)
    if params.nil?
      @support_ticket_list = SupportTicket.unarchived.order('created_at DESC')
    else
      @support_ticket_list = search_support_tickets(params)
    end
  end

  def results
    @support_ticket_list
  end 

  def search_support_tickets(params)
    support_tickets = SupportTicket
    if params[:message].present?
      support_tickets = support_tickets.where("lower(message) LIKE ?", params[:message].downcase)
    end
  end
end
