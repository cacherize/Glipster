class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :title
      t.string :game
      t.string :note, limit: 2048
      t.timestamps
    end
  end
end
