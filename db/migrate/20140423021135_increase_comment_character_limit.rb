class IncreaseCommentCharacterLimit < ActiveRecord::Migration
  def change
    change_column :comments, :message, :string, limit: 512
  end
end
