class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :confirm_logged_in, only: [:edit, :update, :destroy]#this line goes last!!!


  # GET /users
  # GET /users.json
  def index
    if is_admin
      @users = User.all
    else
      flash[:loginmessage] = 'You must be logged in AND an admin to access this page'
      redirect_to (root_path)
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @recipes = @user.recipes
    @recipes = Kaminari.paginate_array(@recipes).page(params[:page]).per(2)
  end

  # GET /users/new
  def new
    #if there is session information in omniauth
    if session[:omniauth].nil?
      @user = User.new
    else
      @user = User.create_new_from_omniauth(session[:omniauth])
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.user_level = 1
    @user.privileges = 0 #0 is for basic user
    @user.points = 0

    respond_to do |format|
      if @user.save
        # Deliver the signup email
        UserNotifierMailer.send_signup_email(@user).Deliver
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_name, :password, :first_name, :last_name, :email, :privileges, :user_level, :points, :uid, :provider, :bio)
    end

    def confirm_logged_in
      unless session[:user_id] == @user.id || is_admin
        flash[:loginmessage] = 'You do not have permission to edit that user'
        redirect_to (root_path)
      end
    end
end
