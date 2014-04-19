class AddAllPlaysColumns < ActiveRecord::Migration
  def up
    add_column :games, :weekly_plays, :integer
    add_column :games, :monthly_plays, :integer
  end

  def down
    remove_column :games, :weekly_plays
    remove_column :games, :monthly_plays
  end
end
