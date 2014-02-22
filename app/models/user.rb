class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation, :admin, :activated
  has_secure_password

  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: true, on: :create
  validates :username, presence: true, uniqueness: true, on: :create
end
