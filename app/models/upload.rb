class Upload < ActiveRecord::Base
  attr_accessible :title, :game, :note
  mount_uploader :game, GameUploader
  belongs_to :user
  validates_presence_of :title
end
