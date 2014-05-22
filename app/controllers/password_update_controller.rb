class PasswordUpdateController < ApplicationController
  def edit
    @user = User.find_by_username(params[:id])
  end

  def update
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
end
