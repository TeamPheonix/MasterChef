class UserNotifierMailer < ApplicationMailer
  default from: 'masterchefgroup3@gmail.com', return_path: 'masterchefgroup3@gmail.com'

  # send a signup email to the user, pass in the user object that contains the user's email address
  def send_signup_email(user)
    @user = user
    @url = 'https://masterchef-group-3.herokuapp.com/sessions/login'
    mail(to: @user.email, subject: 'Thank you for signing up at MasterChef')
  end

  # Login error mailer
  def send_loginerror_email(user)
    @user = user
    mail(to: @user.email, subject: 'Failed Login Alert')
  end

  # Email Recipe to Current User Self
  def emailrecipe(recipe, user)
    @user = user
    @recipe = recipe
    mail(to: @user.email, subject: 'Your Chosen Recipe from MasterChef')
  end

  # Newsletter mailer by Admin to All Users directly through website
  def newsletter(recipe, user)
    @user = user
    @recipe = recipe
    mail(to: @user.email, subject: 'Weekly Recommended Recipes from MasterChef')
  end

  # Newsletter mailer by Admin to All Users through rake task, run...
  # $ rake send_email:newsletter2
  # Once pushed to Heroku, run...
  # $ heroku run rake send_email:newsletter2
  def newsletter2(user)
    @user = user
    mail(to: @user.email, subject: 'Special Newsletter from MasterChef')
  end

end
