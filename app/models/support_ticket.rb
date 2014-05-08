class SupportTicket < ActiveRecord::Base
  attr_accessible :email, :reason, :message, :stickied, :archive, :other_reason

  def archive
    self.archived_at
  end

  def archive=(boolean)
    raise boolean.inspect
  end

  def success_message
    reason = self.reason
    case reason
    when ""
    when "trouble registering"; "We're sorry that you're having trouble registering. Please wait for a reply on any further action."
    when "making a suggestion"; "Thank you for your suggestion! Staff will review it."
    when "report bug";          "Thanks for the bug report! Our staff will take time to review it."
    else
      "We got your message! A response will be delivered if necessary."
    end
  end
end
