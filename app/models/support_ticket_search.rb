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

    if params[:unarchived] == "0"
      support_tickets = support_tickets.archived
    end

    if params[:archived] == "0"
      support_tickets = support_tickets.unarchived
    end

    if params[:reason].present?
      params[:reason].each do |reason|
        support_tickets = support_tickets.reject{|st| st.reason == reason}
      end
    end

    if params[:order].present? && (params[:order] == "oldest")
      support_tickets = support_tickets.sort_by(&:created_at)
    else
      support_tickets = support_tickets.sort_by(&:created_at).reverse
    end

    return support_tickets
  end
end
