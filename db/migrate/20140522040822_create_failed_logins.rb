class CreateFailedLogins < ActiveRecord::Migration
  def change
    create_table :failed_logins do |t|
      t.string :requester
      t.integer :attempts
      t.datetime :attempted_at
      t.timestamps
    end
  end
end
