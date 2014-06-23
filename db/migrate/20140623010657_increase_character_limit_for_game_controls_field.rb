class IncreaseCharacterLimitForGameControlsField < ActiveRecord::Migration
  def up
    change_column :games, :controls, :string, limit: 2048
  end

  def down
    change_column :games, :controls, :string, limit: 255
  end
end
