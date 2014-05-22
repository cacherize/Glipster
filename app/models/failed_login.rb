class FailedLogin < ActiveRecord::Base
  attr_accessible :requester, :attempts, :attempted_at
end
