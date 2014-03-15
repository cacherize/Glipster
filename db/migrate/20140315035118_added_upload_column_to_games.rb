class AddedUploadColumnToGames < ActiveRecord::Migration
  def up
  	add_column :games, :flash_file, :string
  end

  def down
  	remove_column :games, :flash_file
  end
end
