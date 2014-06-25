class AddBrowserColumnAndGameIdToSupportTickets < ActiveRecord::Migration
  def change
    add_column :support_tickets, :game_id, :integer
    add_column :support_tickets, :browser_version, :string, limit: 512
  end
end
