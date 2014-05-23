class FailedLogin < ActiveRecord::Base
  attr_accessible :requester, :attempts, :attempted_at

  def reached_attempts_limit
    if self.attempted_at > 8.minutes.ago
      if attempts > 14
        true
      else
        false
      end
    else
      !self.destroy
    end
  end
end
