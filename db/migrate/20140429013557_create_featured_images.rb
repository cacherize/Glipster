class CreateFeaturedImages < ActiveRecord::Migration
  def change
    create_table :featured_images do |t|
      t.string :image_uid
      t.string :title
      t.string :link

      t.timestamps
    end
  end
end
