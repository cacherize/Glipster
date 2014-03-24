class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :store_location

  APP_NAME = "glipster"

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

  def authorize
		redirect_to login_path, alert: 'Please log in to complete that action' unless current_user.present?  
  end

  helper_method :current_user
end
