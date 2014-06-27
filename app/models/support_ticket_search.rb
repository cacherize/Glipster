class SupportTicketSearch
  def initialize(params)
    if params.nil?
      @support_ticket_list = SupportTicket.unarchived.order('created_at DESC')
    else
    end
  end

  def results
    @support_ticket_list
  end 
end
