module SupportTicketsHelper
  def mark_support_ticket_reason_filters(reason, filters)
    if filters.present? && filters[:reason].present?
      filters[:reason].include?(reason)
    end
  end
end
