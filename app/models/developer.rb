class Developer < ActiveRecord::Base
  attr_accessible :name, :link
  validates_presence_of :name
  validates_presence_of :link
end
