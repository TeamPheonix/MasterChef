class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  # Sets the variable @current_user to a user model based on the session[:user_id]
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] && User.exists?(session[:user_id])
  end
  helper_method :current_user

  # Sets the variable @is_admin to t/f based on the session[:user_id]
  def is_admin
  	@is_admin = false
  	if current_user
    	@is_admin = (@current_user.privileges == 1)
    end
  end
  helper_method :is_admin

  # Sets the variable @have_permission to t/f based on the session[:user_id] && wether admin or not
  def have_permission
    @have_permission = false
    if current_user
      @have_permission = (@current_user.privileges == 1 || session[:user_id] == @current_user.id)
    end
  end
  helper_method :have_permission

  def verify_google_recptcha(response)
    if Rails.env.production?
      status = HTTParty.get("https://www.google.com/recaptcha/api/siteverify?secret=#{ENV['RECAPTCHA_SECRET_KEY']}&response=#{response}")
    else
      status = HTTParty.get("https://www.google.com/recaptcha/api/siteverify?secret=#{ENV['RECAPTCHA_SECRET_KEY']}&response=#{response}", :verify => false, format: :json)
    end
    status['success'] ? true : false
  end
  helper_method :verify_google_recptcha
end
