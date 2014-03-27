class Comment < ActiveRecord::Base
  attr_accessible :game_id, :message
end
