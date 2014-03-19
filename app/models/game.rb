class Game < ActiveRecord::Base
  attr_accessible :title, :description, :controls, :play_count, :flash_file, :image
  mount_uploader :flash_file, GameUploader
  dragonfly_accessor :image

  def to_param
  	"#{id} #{title}".parameterize
  end

  def flash_file_name
  	File.basename(flash_file.path || flash_file.filename) if flash_file
  end
end
