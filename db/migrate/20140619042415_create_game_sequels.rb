class CreateGameSequels < ActiveRecord::Migration
  def change
    create_table :game_sequels do |t|
      t.belongs_to :sequel
      t.belongs_to :game
      t.timestamps
    end
  end
end
