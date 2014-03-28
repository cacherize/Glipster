class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation, :admin, :activated, :image
  has_secure_password
  
  before_save :downcase_email
  before_create { generate_token(:auth_token) }

  has_many :comments

  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: true, on: :create
  validates :username, presence: true, uniqueness: true, on: :create

  dragonfly_accessor :image

  def to_param
  	"#{self.username}"
  end

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

	def send_account_confirmation
		UserMailer.account_confirmation(self).deliver
	end

	def send_password_reset
		generate_token(:password_reset_token)
		self.password_reset_sent_at = Time.zone.now
		save!
		UserMailer.password_reset(self).deliver
	end

	def generate_token(column)
		begin
			self[column]= SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end
end
