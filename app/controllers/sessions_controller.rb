class SessionsController < ApplicationController
  skip_filter :store_location

  def new
  end

  def create
  	if params[:username].present?
	  	user = User.find_by_email_or_username(params[:username])
	  end
  	if user && user.authenticate(params[:password])
  		if user.activated?
	  		if params[:remember_me]
	  			cookies.permanent[:auth_token] = user.auth_token
	  		else
	  			cookies[:auth_token] = user.auth_token
	  		end
	  		redirect_back_or_default('/')
        flash[:notice] = "Logged in!"
	  	else
	  		redirect_to login_path, alert: 'Please check you inbox for a confirmation email to activate your account'
	  	end
  	else
  		flash.now.alert = "Invalid login credentials"
  		render 'new'
  	end
  end

  def destroy
  	cookies.delete(:auth_token)
  	redirect_to root_path, notice: 'Logged out!'
  end
end
