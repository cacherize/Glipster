class CreateSupportTickets < ActiveRecord::Migration
  def change
    create_table :support_tickets do |t|
      t.string :email
      t.string :reason
      t.string :message
      t.boolean :stickied
      t.datetime :archived_at
      t.timestamps
    end
  end
end
