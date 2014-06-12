class UserMailer < ActionMailer::Base
  default from: "no-reply@glipster.com"

  unless self.included_modules.include?(AbstractController::Callbacks)
    include AbstractController::Callbacks
  end
  
  before_filter :add_inline_attachments!

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

  private
 
  def add_inline_attachments!
    attachments.inline["logo.jpg"] = File.read("#{Rails.root}/app/assets/images/email_logo.png")
  end
end
