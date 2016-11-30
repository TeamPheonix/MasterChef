require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user1 = User.new(:email => "bob@b.b", :user_name => "admin", :password => "admin", :privileges => 1)
    @user2 = User.new(:email => "bob@bs.b", :user_name => "admfin", :password => "adfmin", :privileges => 0)
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create two users" do
    assert_difference('User.count') do
      post users_path, params: { user: { :email => @user1.email, password: @user1.password, privileges: @user1.privileges, user_name: @user1.user_name} }
    end

    assert_difference('User.count') do
      post users_path, params: { user: { :email => @user2.email, password: @user2.password, privileges: @user2.privileges, user_name: @user2.user_name} }
    end
  end

  test "should show user" do
    get user_url(User.where(user_name: @user1.user_name).first)
    assert_response :success
  end

  test "should log in" do
    login(@user1.user_name, @user1.password)#one is admin
  end

  test "should redirect if not admin access user list" do
    login(@user2.user_name, @user2.password)#2 is not admin
    get users_path
    assert_redirected_to root_path
  end

  test "should update user" do
    login(@user1.user_name, @user1.password)#one is admin
    patch user_url(User.where(user_name: @user1.user_name).first), params: { user: { first_name: "random"} }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user if admin" do
    login(@user1.user_name, @user1.password)#one is admin
    delete user_url(User.where(user_name: @user1.user_name).first)
    assert_response :success
  end

  def login(user_name, password)
    # perform the actual login
    post sessions_attempt_login_path(:username => user_name, :password => password)
    assert_redirected_to root_path
    # check the users's values in the session
    assert_not_nil session[:user_id]
    assert_equal session[:user_id], (User.where(user_name: user_name).first).id
  end

end