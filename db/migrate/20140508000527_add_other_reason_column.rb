class AddOtherReasonColumn < ActiveRecord::Migration
  def up
    add_column :support_tickets, :other_reason, :string, after: :reason
  end

  def down
    remove_column :support_tickets, :other_reason
  end
end
