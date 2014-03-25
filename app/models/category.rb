class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :game_categories
  has_many :games, through: :game_categories

  def to_param
  	"#{id}-#{name}".parameterize
  end
end
