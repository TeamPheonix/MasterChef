require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # setup do
  #   @user = users(:one)
  #   @user2 = users(:two)
  # end
  #
  # test "should get new" do
  #   get new_user_url
  #   assert_response :success
  # end
  #
  # test "should create user" do
  #   assert_difference('User.count') do
  #     post users_url, params: { user: { email: @user.email, first_name: @user.first_name, last_name: @user.last_name, password: @user.password, points: @user.points, privileges: @user.privileges, user_level: @user.user_level, user_name: @user.user_name } }
  #     post users_url, params: { user: { email: @user2.email, first_name: @user2.first_name, last_name: @user2.last_name, password: @user2.password, points: @user2.points, privileges: @user2.privileges, user_level: @user2.user_level, user_name: @user2.user_name } }
  #   end
  #
  #   assert_redirected_to user_url(User.last)
  # end
  #
  #  test "should redirect if not admin access user list" do
  #   get users_url
  #   assert_redirected_to root_path
  #
  #   session[:user_id => @user.id]#one is admin
  #   get users_url
  #   assert_response :success
  # end
  #
  # test "should show user" do
  #   get user_url(@user)
  #   assert_response :success
  # end
  #
  # test "should update user" do
  #   session[:user_id => @user.id]#one is admin
  #   patch user_url(@user), params: { user: { email: @user.email, first_name: @user.first_name, last_name: @user.last_name, password: @user.password, points: @user.points, privileges: @user.privileges, user_level: @user.user_level, user_name: @user.user_name } }
  #   assert_redirected_to user_url(@user)
  # end
  #
  # test "should destroy user if admin" do
  #   session[:user_id => @user2.id]
  #   assert_difference('User.count', -1) do
  #     delete user_url(@user)
  #   end
  #   assert_redirected_to root_path
  #   session[:user_id => @user2.id]
  #   delete user_url(@user)
  #   assert_redirected_to user_url
  #
  # end

  test "invalid signup information" do
    assert_no_difference 'User.count' do
      post users_path, params:{user: {password:'',user_name:'', email: ''}}
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    @before_count = User.count
    post  users_path params:{user: {password:'askdh', user_name:'Extreme112', email:'valid@gmail.com'}}
    @after_count = User.count
    assert_equal @before_count + 1, @after_count
  end
end