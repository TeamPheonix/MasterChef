require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get loginpage with form" do
    get sessions_login_path
    assert_response :success
    assert_select 'form'
  end


end
