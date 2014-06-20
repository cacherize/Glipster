class GameSequel < ActiveRecord::Base
  attr_accessible :game_id, :sequel_id
  belongs_to :game
  belongs_to :sequel, class_name: 'Game'
  default_scope order('position ASC')
end
