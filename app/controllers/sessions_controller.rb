class SessionsController < ApplicationController
  def new
  end

  def create
  	if params[:username].present?
	  	user = User.find_by_email(params[:username].downcase)
	  end
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to root_path, notice: 'Logged in!'
  	else
  		render 'new'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path, notice: 'Logged out!'
  end
end
