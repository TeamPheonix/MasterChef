# Preview all emails at http://localhost:3000/rails/mailers/user_notifier_mailer
class UserNotifierMailerPreview < ActionMailer::Preview
  def send_signup_email
    UserNotifierMailer.send_signup_email(User.first)
  end
end
