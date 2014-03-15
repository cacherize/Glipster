class Game < ActiveRecord::Base
  attr_accessible :title, :description, :controls, :play_count
end
