class Reputation < ActiveRecord::Base
  attr_accessible :user_id, :game_id, :value
  belongs_to :user
  belongs_to :game
  default_scope order("created_at DESC")
  scope :positive_reps, where("value = ?", 1)
end
