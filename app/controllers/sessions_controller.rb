class SessionsController < ApplicationController
  def new
  end

  def create
  	if params[:username].present?
	  	user = User.find_by_email_or_username(params[:username])
	  end
  	if user && user.authenticate(params[:password])
  		if user.activated?
	  		session[:user_id] = user.id
	  		redirect_to root_path, notice: 'Logged in!'
	  	else
	  		redirect_to login_path, alert: 'Please check you inbox for a confirmation email to activate your account'
	  	end
  	else
  		flash.now.alert = "Invalid login credentials"
  		render 'new'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path, notice: 'Logged out!'
  end
end
