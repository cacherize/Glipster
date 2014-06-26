class AddRequesterColumnToSupportTickets < ActiveRecord::Migration
  def change
    add_column :support_tickets, :requester, :string
  end
end
