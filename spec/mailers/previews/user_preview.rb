# Preview all emails at http://localhost:3000/rails/mailers/user
class UserPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user/reset_password_email
  def reset_password_email
    UserMailer.reset_password_email
  end

end
