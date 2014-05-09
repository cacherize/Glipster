class RemoveCommentColumnsFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :comment_count
    remove_column :users, :comment_timer
  end

  def down
    add_column :users, :comment_count, :integer, default: 0
    add_column :users, :comment_timer, :datetime
  end
end
