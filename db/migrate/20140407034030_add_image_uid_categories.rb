class AddImageUidCategories < ActiveRecord::Migration
  def up
  	add_column :categories, :image_uid, :string
  end

  def down
  	remove_column :categories, :image_uid
  end
end
