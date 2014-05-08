class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation, :admin, :activated, :image, :current_password
  has_secure_password
  
  before_save :downcase_email
  before_create { generate_token(:auth_token) }
  after_validation { self.errors.messages.delete(:password_digest) }
  
  has_many :comments

  validates :password, presence: {message: 'must be provided'}, on: :create
  validates :email, presence: {message: 'must be provided'}, uniqueness: true, on: :create
  validates :username, presence: {message: 'must be provided'}, uniqueness: true, on: :create
  validates_format_of :email, with: /[-0-9a-z.+_]+@[-0-9a-z.+_]+\.[a-z]{2,4}/i, if: lambda{self.email.present?}
  validates_format_of :username,
    with: /^[a-z0-9_-]*$/i,
    message: 'must only contain alphanumeric characters',
    if: lambda{self.username.present?}

  dragonfly_accessor :image

  def current_password=(password)
    password
  end

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

  def check_password_matches(password)
    self.authenticate(password) == self
  end
end
