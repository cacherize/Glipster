class CreateGameUsers < ActiveRecord::Migration
  def change
    create_table :game_users do |t|
      t.belongs_to :user
      t.belongs_to :game
      t.timestamps
    end
  end
end
