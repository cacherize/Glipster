class AddPlaysColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :plays, :integer, default: 0
  end
end
