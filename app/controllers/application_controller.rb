class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  # Sets the variable @current_user to a user model based on the session[:user_id]
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
