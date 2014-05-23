class SessionsController < ApplicationController
  skip_filter :store_location

  def new
  end

  def create
    fail_tracker = FailedLogin.find_by_requester(request.remote_ip)

    if !fail_tracker.nil? && fail_tracker.reached_attempts_limit
      timer = fail_tracker.attempted_at - 8.minutes.ago
      redirect_to(login_path, alert: "You have too many failed login attempts. Please try again in #{(timer/60).ceil} minutes.")
      return
    end

  	if params[:login].present?
	  	user = User.find_by_email_or_username(params[:login])
	  end
  	if user && user.authenticate(params[:password])
  		if user.activated?
	  		if params[:remember_me]
	  			cookies.permanent[:auth_token] = user.auth_token
	  		else
	  			cookies[:auth_token] = user.auth_token
	  		end
        fail_tracker.destroy unless fail_tracker.nil?
	  		redirect_back_or_default('/')
        flash[:notice] = "Logged in!"
	  	else
	  		redirect_to login_path, alert: 'Please check you inbox for a confirmation email to activate your account'
	  	end
  	else
      if fail_tracker.nil?
        FailedLogin.create(requester: request.remote_ip, attempts: 1, attempted_at: DateTime.now)
      else
        fail_tracker.increment!(:attempts, 1)
      end
  		flash.now.alert = "Invalid login credentials"
  		render 'new'
  	end
  end

  def destroy
  	cookies.delete(:auth_token)
  	redirect_to root_path, notice: 'Logged out!'
  end
end
