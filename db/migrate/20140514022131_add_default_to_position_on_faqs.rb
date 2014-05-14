class AddDefaultToPositionOnFaqs < ActiveRecord::Migration
  def change
    change_column :faqs, :position, :integer, default: 0
  end
end
