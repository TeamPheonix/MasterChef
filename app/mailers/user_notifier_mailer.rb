class UserNotifierMailer < ApplicationMailer
  default from: 'masterchefgroup3@gmail.com'
  layout 'mailer'

  # send a signup email to the user, pass in the user object that contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email, :subject => 'Thanks for signing up for MasterChef')
  end

  def welcome_email(user)
    @user = user
    @url = 'https://masterchef-group-3.herokuapp.com/sessions/login'
    recipients user.email
    from "MasterChef Notifications <notificiations@example.com>"
    subject   "Welcome to MasterChef"
    send_on   Time.now
    body      {:user => user, :url => "https://masterchef-group-3.herokuapp.com"}
  end
end
