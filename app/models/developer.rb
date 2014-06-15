class Developer < ActiveRecord::Base
  attr_accessible :name, :link
  validates_presence_of :name
  has_many :games
end
