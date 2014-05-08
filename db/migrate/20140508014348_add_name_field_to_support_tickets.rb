class AddNameFieldToSupportTickets < ActiveRecord::Migration
  def change
    add_column :support_tickets, :name, :string
  end
end
