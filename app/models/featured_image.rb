class FeaturedImage < ActiveRecord::Base
  attr_accessible :title, :link, :image, :position
  dragonfly_accessor :image
  validates_presence_of :image, :link
  before_create :increase_existing_images_positions
  default_scope order('position ASC')

  def increase_existing_images_positions
    FeaturedImage.all.each{|img| img.increment!(:position) }
  end

  def display_position
    self.position + 1
  end
end
