class Reputation < ActiveRecord::Base
  attr_accessible :user_id, :game_id, :value
  belongs_to :user
  belongs_to :game
end
