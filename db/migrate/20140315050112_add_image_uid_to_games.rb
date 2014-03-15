class AddImageUidToGames < ActiveRecord::Migration
  def change
    add_column :games, :image_uid, :string
  end
end
