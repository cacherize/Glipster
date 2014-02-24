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

	def confirm
		@user = User.find_by_auth_token!(params[:id])
		if @user
			@user.update_column(:activated, true)
			redirect_to root_path, notice: "Successfully activated account! You may now login."
		else
			redirect_to root_path, alert: "Unable to activate account."
		end
	end
end
