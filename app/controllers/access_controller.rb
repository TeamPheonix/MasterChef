class AccessController < ApplicationController
  def login
    #display login form
  end

  def attempt_login
    @username_param = params[:username]
    @password_param = params[:password]

    if User.exists?(user_name: @username_param, password: @password_param)
      @user = User.where(user_name: @username_param, password: @password_param).first #.first is needed so it returns 1 object only
      flash[:loginmessage] = "Login successful #{@user.user_name}."
      redirect_to(:action => :logintest)
    else
      flash[:loginmessage] = "Login failed."
      redirect_to(:action => :login)
    end
  end

  def logintest

  end

  def logout

  end
end
