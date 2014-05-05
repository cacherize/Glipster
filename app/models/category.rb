class Category < ActiveRecord::Base
  attr_accessible :name, :image
  has_many :game_categories
  has_many :games, through: :game_categories
  has_many :featured_category_games
  validates_presence_of :name
  default_scope{ order('name') }

  def to_param
  	"#{id}-#{name}".parameterize
  end

  def featured_category_games_ids
  	featured_category_games.map(&:game_id)
  end
end
