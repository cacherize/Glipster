class RemoveImageUidFromCategories < ActiveRecord::Migration
  def up
  	remove_column :categories, :image_uid
  end

  def down
  	add_column :categories, :image_uid, :string
  end
end
