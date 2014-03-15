require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  protect_from_dos_attacks true
  secret "d538e3695f70ec2defe498aaa55a4d612b8ba4d6a9449e2bfc9ce2c6c6596fec"

  url_format "/media/:job/:name"

  # if Rails.env.test? || Rails.env.development?
	  # datastore :file,
	  #   root_path: Rails.root.join('public/system/dragonfly', Rails.env),
	  #   server_root: Rails.root.join('public')
	datastore :s3,
    bucket_name: ENV["AWS_THUMBS_BUCKET"],
    access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
