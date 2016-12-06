require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user1 = User.new(:email => "bob@b.b", :user_name => "admin", :password => "admin", :privileges => 1)
    @user2 = User.new(:email => "bob@bs.b", :user_name => "admfin", :password => "adfmin", :privileges => 0)
    post users_path, params: { user: { :email => @user2.email, password: @user2.password, privileges: @user2.privileges, user_name: @user2.user_name} }
    post users_path, params: { user: { :email => @user1.email, password: @user1.password, privileges: @user1.privileges, user_name: @user1.user_name} }
  end

  test "should get loginpage with form" do
    get sessions_login_path
    assert_response :success
    assert_select 'form'
  end

  test "should redirect to homepage on successful login" do
    post sessions_attempt_login_path(:username => @user1.user_name, :password => @user1.password)
    assert_not_nil session[:user_id]
    assert_redirected_to root_path
  end

  test "should re-render form on failed login" do
    post sessions_attempt_login_path(:username => @user1.user_name, :password => 'wrongpassword')
    follow_redirect!
    assert_template 'sessions/login'
    assert_select 'strong', 'Login failed.'
  end

end
