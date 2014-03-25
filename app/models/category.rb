class Category < ActiveRecord::Base
  attr_accessible :name

  def to_param
  	"#{id}-#{name}".parameterize
  end
end
