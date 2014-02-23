class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation, :admin, :activated
  has_secure_password
  
  before_save :downcase_email

  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: true, on: :create
  validates :username, presence: true, uniqueness: true, on: :create

  def downcase_email
	  self.email.downcase! if self.email
	end

	def self.find_by_email_or_username(arg)
		if arg.match(/^[a-z0-9_.+-]+@[a-z0-9-]+\.[a-z0-9-.]+$/i)
			find_by_email(arg.downcase)
		else
			find_by_username(arg.downcase)
		end
	end
end
