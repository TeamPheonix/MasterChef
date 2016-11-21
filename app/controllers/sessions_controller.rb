class SessionsController < ApplicationController
  def new
    auth = request.env["omniauth.auth"]
    session[:omniauth] = auth
    # if user can login, meaning user already as an account with us
    if User.exists_from_omniauth(auth)
      @user = User.sign_in_from_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Login successful #{@user.user_name}."
    else # user has no account with us yet
      redirect_to (new_user_path)
    end
  end

  def destroy
    current_user
    session[:omniauth] = nil
    session[:user_id] = nil

    redirect_to root_path, notice: "Signed out."
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

    if User.exists?(user_name: @username_param)
      @user = User.where(user_name: @username_param).first
      @password_param = BCrypt::Engine.hash_secret(@password_param, @user.salt)
    end

    if User.exists?(user_name: @username_param, password: @password_param)
      @user = User.where(user_name: @username_param, password: @password_param).first #.first is needed so it returns 1 object only
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Login successful #{@user.user_name}."
    else
      redirect_to sessions_login_path, notice: "Login failed ."
    end
  end
end
