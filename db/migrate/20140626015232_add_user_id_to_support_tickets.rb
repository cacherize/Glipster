class AddUserIdToSupportTickets < ActiveRecord::Migration
  def change
    add_column :support_tickets, :user_id, :integer
  end
end
