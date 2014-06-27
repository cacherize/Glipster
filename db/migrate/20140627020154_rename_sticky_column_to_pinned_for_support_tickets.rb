class RenameStickyColumnToPinnedForSupportTickets < ActiveRecord::Migration
  def up
    rename_column :support_tickets, :stickied, :pinned
  end

  def down
    rename_column :support_tickets, :pinned, :stickied
  end
end
