class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  default from: 'from@example.com'

  def reset_password_email
    @user = User.find(user.id)
    @url = edit_password_path(@user.reset_password_token)
    mail to: user.email, subject: 'パスワードリセット'
  end
end
