class AccessController < ApplicationController
  before_action :confirm_logged_in, :only => [:obscure_session, :logintest]

  def login
    if session[:user_name]
      redirect_to(access_logintest_path)
    end
  end

  def obscure_session

  end

  def attempt_login
    @username_param = params[:username]
    @password_param = params[:password]

    if User.exists?(user_name: @username_param, password: @password_param)
      @user = User.where(user_name: @username_param, password: @password_param).first #.first is needed so it returns 1 object only
      session[:user_name] = @user.user_name
      flash[:loginmessage] = "Login successful #{@user.user_name}."
      redirect_to(access_logintest_path)
    else
      flash[:loginmessage] = "Login failed."
      redirect_to(access_login_path)
    end
  end

  def logintest

  end

  def logout
    session[:user_name] = nil
    flash[:loginmessage] = 'Logged out.'
    redirect_to(access_login_path)
  end

  private

  def confirm_logged_in
    unless session[:user_name]
      flash[:loginmessage] = 'Please Login'
      redirect_to (access_login_path)
    end
  end
end
