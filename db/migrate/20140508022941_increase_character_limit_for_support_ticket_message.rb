class IncreaseCharacterLimitForSupportTicketMessage < ActiveRecord::Migration
  def up
    change_column :support_tickets, :message, :string, limit: 2048
  end

  def down
    change_column :support_tickets, :message, :string, limit: 255
  end
end
