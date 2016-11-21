require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welcome_index_url
    assert_response :success
  end

  test "should get about page" do
    get welcome_about_path
    assert_response :success
  end

  test "should get contact page" do
    get welcome_contact_path
    assert_response :success
  end

  # test "should get recipe index if admin" do
  #   @user = User.new(user_name: 'admin', password: 'admin', email: 'admin@admin.com', first_name: 'admin', last_name:'admin', privileges:1)
  #   get recipe_path
  #   assert_response :success
  # end

end
