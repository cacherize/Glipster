class SupportTicket < ActiveRecord::Base
  attr_accessible :email, :reason, :message, :stickied, :archive, :other_reason

  def archive
    self.archived_at
  end

  def archive=(boolean)
    raise boolean.inspect
  end
end
