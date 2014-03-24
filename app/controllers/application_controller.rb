class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
  	@current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  def authorize
		redirect_to login_path, alert: 'Please log in to complete that action' unless current_user.present?  
  end

  helper_method :current_user
end
