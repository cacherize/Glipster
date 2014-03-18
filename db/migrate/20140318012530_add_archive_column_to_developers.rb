class AddArchiveColumnToDevelopers < ActiveRecord::Migration
  def change
    add_column :developers, :archived_at, :datetime
  end
end
