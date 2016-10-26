require 'test_helper'

class BoostrapControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get boostrap_index_url
    assert_response :success
  end

end
