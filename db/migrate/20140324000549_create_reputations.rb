class CreateReputations < ActiveRecord::Migration
  def change
    create_table :reputations do |t|
      t.belongs_to :game
      t.belongs_to :user
      t.timestamps
    end
  end
end
