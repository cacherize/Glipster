class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		respond_to do |format|
			if @user.save 
				@user.send_account_confirmation
				format.html {redirect_to root_path, notice: "Thank you for registering! Please check your email for a confirmation email."}
			else
				format.html {render :new}
			end
		end
	end

	def show
		@user = User.find_by_username(params[:id])
	end

	def edit
	end

	def update
		@user = User.find_by_username(params[:id])
		respond_to do |format|
			if @user.update_attributes(params[:user])
				format.html{redirect_to @user, notice: "Updated profile!"}
			else
				format.html{render :edit}
			end
		end
	end

	def confirm
		@user = User.find_by_auth_token!(params[:id])
		if @user
			@user.update_column(:activated, true)
			redirect_to root_path, notice: "Successfully activated account! You may now login."
		else
			redirect_to root_path, alert: "Unable to activate account."
		end
	end

  def change_password
    @user = User.find_by_username(params[:id])
  end

  def update_password
    @user = User.find_by_username(params[:id])
    if params[:user][:current_password].present?
      current_pw_valid = @user.check_password_matches(params[:user][:current_password])
      redirect_to(change_password_user_path(@user), alert: "You must enter a new password") && return unless params[:user][:password].present?
    else
      redirect_to change_password_user_path(@user), alert: "You must enter your old password"
      return
    end
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html{redirect_to @user, notice: "Successfully changed your password!"}
      else
        format.html{render :change_password}
      end
    end
  end

  def check_username
    @username_invalid = false
    if params[:username].present?
      if params[:username].length < 3
        @username_invalid = "invalid length"
      else
        user = User.find(:all, :conditions => ["lower(username) = ?", params[:username].downcase])
        @username_invalid = true if user.present?
      end
    else
      @username_invalid = nil
    end
    respond_to do |format|
      format.js
    end
  end
end
