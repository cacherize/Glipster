class AddDefaultToPlaysColumns < ActiveRecord::Migration
  def self.up
    change_column :games, :daily_plays, :integer, default: 0
    change_column :games, :weekly_plays, :integer, default: 0
    change_column :games, :monthly_plays, :integer, default: 0
  end

  def self.down
    change_column :games, :daily_plays, :integer, default: nil
    change_column :games, :weekly_plays, :integer, default: nil
    change_column :games, :monthly_plays, :integer, default: nil
  end
end
