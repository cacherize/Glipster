class PasswordResetsController < ApplicationController
  skip_filter :store_location
  
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	user.send_password_reset if user
  	redirect_to login_path, notice: 'Please check your email for instructions to reset password'
  end

  def edit
  	@user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])

    unless params[:user][:password].present? || params[:user][:password_confirmation].present?
      @user.errors.add(:base, "All fields must be filled out")
      render :edit
      return 
    end
    
    respond_to do |format|
    	if @user.password_reset_sent_at < 3.hours.ago
    		format.html{redirect_to new_password_reset_path, alert: "Password reset has expired"}
    	elsif @user.update_attributes(params[:user])
    		format.html{redirect_to root_path, notice: "Password was successfully updated!"}
    	else
    		format.html{render 'edit'}
    	end
    end
  end
end
