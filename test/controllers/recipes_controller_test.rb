require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get success" do
    get recipes_success_url
    assert_response :success
  end

  test "should get failed" do
    get recipes_failed_url
    assert_response :success
  end

  test "should get index" do
    get recipes_index_url
    assert_response :success
  end

end
