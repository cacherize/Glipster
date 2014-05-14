class Faq < ActiveRecord::Base
  attr_accessible :question, :answer, :position
  validates_presence_of :question, :answer
  default_scope order("question ASC")
end
