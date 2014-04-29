class FeaturedImage < ActiveRecord::Base
  attr_accessible :title, :link, :image
  dragonfly_accessor :image
  validates_presence_of :image, :link
end
