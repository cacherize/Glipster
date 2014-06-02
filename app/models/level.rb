class Level < ActiveRecord::Base
  attr_accessible :stage, :min, :max
  default_scope order('stage ASC')
end
