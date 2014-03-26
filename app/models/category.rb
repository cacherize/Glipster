class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :game_categories
  has_many :games, through: :game_categories
  has_many :featured_category_games

  def to_param
  	"#{id}-#{name}".parameterize
  end
end
