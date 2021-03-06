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

    reps = @user.reputations
    
    @likes = reps.find(
      :all,
      conditions: ['value = ?', 1],
      order: 'created_at DESC',
      limit: 5
    ).map(&:game)

    @recently_played = @user.game_users.find(
      :all,
      order: 'created_at DESC',
      limit: 5
    ).map(&:game)
	end

	def edit
	end

	def update
		@user = User.find_by_username(params[:id])
		respond_to do |format|
			if @user.update_attributes(params[:user])
				format.html{redirect_to @user, notice: "Updated profile!"}
			else
        flash[:errors] = @user.errors.full_messages.join("<br/>")
        format.html{redirect_to @user}
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

  def check_username
    user = User.find_by_username(params[:id])
    user.username = params[:username]
    @errors = user.validate_attribute(:username)
    respond_to do |format|
      format.js
    end
  end
end
