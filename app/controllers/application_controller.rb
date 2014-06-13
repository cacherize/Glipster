class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :store_location
  before_filter :redirect_to_under_dev_page

  APP_NAME = "glipster"

  def redirect_to_under_dev_page
    redirect_to 'http://www.glipster.com/under_development.html' unless !Rails.env.production? && request.remote_ip == "209.182.121.64"
  end

  def store_location
  	session["#{APP_NAME}_return_to"] = request.fullpath
  end

  def redirect_back_or_default(default)
  	redirect_to(session["#{APP_NAME}_return_to"] || default)
  	session["#{APP_NAME}_return_to"] = nil
  end

  private

  def current_user
  	@current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  def authenticate
		redirect_to login_path, alert: 'Please log in to complete that action' unless current_user.present?  
  end

  def authorize
    raise 'Not authorized' unless current_user && current_user.admin?
  end

  helper_method :current_user
end
