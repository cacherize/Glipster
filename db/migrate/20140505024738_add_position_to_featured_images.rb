class AddPositionToFeaturedImages < ActiveRecord::Migration
  def change
    add_column :featured_images, :position, :integer, default: 0
  end
end
