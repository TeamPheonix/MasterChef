class SessionsController < ApplicationController
  def new
    auth = request.env["omniauth.auth"]
    session[:omniauth] = auth
    # if user can login, meaning user already as an account with us
    if User.exists_from_omniauth(auth)
      @user = User.sign_in_from_omniauth(auth)
      session[:user_id] = @user.id
      flash[:loginmessage] = "Login successful #{@user.user_name}."
      redirect_to root_path
    else # user has no account with us yet
      redirect_to (new_user_path)
    end
  end

  def destroy
    current_user
    flash[:sign_out_message] = "#{current_user.user_name} logged out"
    session[:omniauth] = nil
    session[:user_id] = nil

    redirect_to root_path, notice: 'Signed Out'
  end

  def psuedo_destroy
    session[:omniauth] = nil
    session[:user_id] = nil
    redirect_to new_user_path
  end

  def login
    if session[:user_id]
      redirect_to root_path
    end
  end

  def attempt_login
    @username_param = params[:username]
    @password_param = params[:password]

    if User.exists?(user_name: @username_param, password: @password_param)
      @user = User.where(user_name: @username_param, password: @password_param).first #.first is needed so it returns 1 object only
      session[:user_id] = @user.id
      flash[:loginmessage] = "Login successful #{@user.user_name}."
      redirect_to(root_path)
    else
      flash[:loginmessage] = "Login failed."
      # when the login failed, send out alert email
      UserNotifierMailer.send_loginerror_email(@user).deliver_now
      redirect_to(sessions_login_path)
    end
  end
end
