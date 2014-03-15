class Game < ActiveRecord::Base
  attr_accessible :title, :description, :controls, :play_count, :flash_file
  mount_uploader :flash_file, GameUploader
end
