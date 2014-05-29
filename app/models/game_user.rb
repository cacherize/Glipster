class GameUser < ActiveRecord::Base
  attr_accessible :user_id, :game_id
  belongs_to :user
  belongs_to :game
  validates :game_id, uniqueness: {scope: :user_id}
end
