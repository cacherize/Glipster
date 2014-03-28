class Comment < ActiveRecord::Base
  attr_accessible :game_id, :message
  belongs_to :game
  belongs_to :user
end
