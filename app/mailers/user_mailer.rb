class UserMailer < ActionMailer::Base
  default from: "no-reply@glipster.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def account_confirmation(user)
    @user = user
    mail to: user.email, subject: "Please Confirm Your Account"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Reset Password Instructions"
  end
end
