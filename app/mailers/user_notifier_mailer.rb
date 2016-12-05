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

  # Mail Recipe
  #def mail

    #mail(to: @user.email, subject: 'Weekly Recommended Recipes')
  #end

  # Newsletter mailer
  def newsletter(recipe, user)
    @user = user
    @recipe = recipe
    mail(to: @user.email, subject: 'Weekly Recommended Recipes from MasterChef')
  end

end
