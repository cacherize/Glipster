class SupportTicket < ActiveRecord::Base
  include ActionView::Helpers::TextHelper
  attr_accessible :email, :reason, :message, :stickied, :archive, :other_reason, :name, :game_id, :user_id
  validates :message, presence: {message: 'must be provided'}
  validates :reason, presence: {message: 'must be selected'}
  validates :email, presence: {message: 'must be provided'}
  validates_format_of :email, with: /[-0-9a-z.+_]+@[-0-9a-z.+_]+\.[a-z]{2,4}/i, if: lambda{self.email.present?}
  validate :other_reason_is_present

  belongs_to :game
  belongs_to :user

  def check_existing_tickets(ip)
    existing_ticket = SupportTicket.where(requester: ip).order("created_at ASC").last
    
    if existing_ticket.present? && existing_ticket.created_at > 10.minutes.ago
      timer = ((existing_ticket.created_at - 10.minutes.ago)/60).ceil
      self.errors.add(:base, "You must wait #{pluralize(timer, 'minutes')} before submitting another ticket")
    end
  end

  def other_reason_is_present
    if self.reason.present? && (self.reason == "other") && self.other_reason.blank?
      errors.add(:base,'Provide a reason if "Other" is selected')
    end
  end

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
