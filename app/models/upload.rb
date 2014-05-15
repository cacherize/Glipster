class Upload < ActiveRecord::Base
  attr_accessible :title, :game, :note
  mount_uploader :game, GameUploader
end
