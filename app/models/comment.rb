class Comment < ActiveRecord::Base
  attr_accessible :game_id, :message
 
  belongs_to :game
  belongs_to :user
  has_many :comment_likes

  validates_presence_of :user_id, :game_id
  default_scope {order('created_at desc')}
end
