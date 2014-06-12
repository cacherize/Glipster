class User < ActiveRecord::Base
  extend Dragonfly::Model::Validations
  attr_accessible :email, :username, :password, :password_confirmation, :admin, :activated, :image, :current_password
  has_secure_password
  
  before_save :downcase_email
  before_create { generate_token(:auth_token) }
  after_validation { self.errors.messages.delete(:password_digest) }
  
  has_many :comments
  has_many :uploads
  has_many :reputations
  has_many :game_users
  has_many :games, through: :game_users
  has_many :comment_likes
  has_many :liked_comments, through: :comment_likes, source: 'comment'

  validates :password, presence: {message: 'must be provided'}, on: :create
  validates :email, presence: {message: 'must be provided'}, uniqueness: true, on: :create
  validates :username, 
    presence: {message: 'must be provided'}, 
    uniqueness: {case_sensitive: false}, 
    length: {minimum: 3, maximum: 30,
      too_long:  "is too long (max 30 chars)",
      too_short: "is too short (min 3 chars)"
    },
    format: {
      with: /^[a-z0-9_-]*$/i,
      message: 'must only contain alphanumeric characters',
      if: lambda{self.username.present?}
    }
  validates_format_of :email, with: /[-0-9a-z.+_]+@[-0-9a-z.+_]+\.[a-z]{2,4}/i, if: lambda{self.email.present?}
  validates_size_of :image, maximum: 3.megabytes, message: "is too big (maximum is 3 MB)", if: :image_changed?
  validates_property :format, of: :image, in: ['jpg', 'jpeg', 'png', 'gif'], message: 'file must be either png, gif, jpg, or jpeg format.', if: :image_changed?

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
      find(:first, :conditions => ["lower(username) = ?", arg.downcase])
		end
	end

	def send_account_confirmation
		UserMailer.delay.account_confirmation(self)
	end

	def send_password_reset
		generate_token(:password_reset_token)
		self.password_reset_sent_at = Time.zone.now
		save!
		UserMailer.delay.password_reset(self)
	end

	def generate_token(column)
		begin
			self[column]= SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end

  def check_password_matches(password)
    self.authenticate(password) == self
  end

  def validate_attribute(attribute_name)
    unless self.valid?
      return self.errors[attribute_name]
    end
  end

  def add_comment(comment)
    self.comments.build(comment)
  end

  def level(value)
    level = Level.find(:all, conditions: ["min <= ? AND max >= ?", value, value]).first
    level = Level.last unless level.present?
    return level
  end

  def level_progress(value)
    level = self.level(value)
    den = (level.max - level.min) + 0.0
    num = (level.max - value)
    value = (1 - (num / den)) * 100

    return "#{value}%"
  end
end
