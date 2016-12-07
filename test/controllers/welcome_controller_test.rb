require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_response :success
  end

  test "should get about page" do
    get welcome_about_path
    assert_response :success
  end

end
