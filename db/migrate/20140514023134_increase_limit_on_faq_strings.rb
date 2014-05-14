class IncreaseLimitOnFaqStrings < ActiveRecord::Migration
  def up
    change_column :faqs, :question, :string, limit: 512
    change_column :faqs, :answer, :string, limit: 2048
  end

  def down
    change_column :faqs, :question, :string, limit: 255
    change_column :faqs, :answer, :string, limit: 255
  end
end
