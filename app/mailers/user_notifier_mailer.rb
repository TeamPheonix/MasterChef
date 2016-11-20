class UserNotifierMailer < ApplicationMailer
  default from: 'masterchefgroup3@gmail.com', return_path: 'masterchefgroup3@gmail.com'

  # send a signup email to the user, pass in the user object that contains the user's email address
  def send_signup_email(user)
    @user = user
    @url = 'https://masterchef-group-3.herokuapp.com/sessions/login'
    mail(to: @user.email, subject: 'Thank you for signing up at MasterChef')
  end

  # Another sample from 'guides.rubyonrails.org/v2.3.8/action_mailer_basics.html', this is kept as reference
  # def welcome_email(user)
  #   @user = user
  #   @url = 'https://masterchef-group-3.herokuapp.com/sessions/login'
  #   recipients user.email
  #   from "MasterChef Notifications <notificiations@example.com>"
  #   subject   "Welcome to MasterChef"
  #   send_on   Time.now
  #   body      {:user => user, :url => "https://masterchef-group-3.herokuapp.com"}
  # end

  # Login error mailer
  def send_loginerror_email(user)
    @user = user
    mail(to: @user.email, subject: 'Failed Login Alert')
  end

  # Newsletter mailer
  def newsletter

    #mail(to: @user.email, subject: 'Weekly Recommended Recipes')
  end

end
