require 'test_helper'

class RecipeControllerTest < ActionDispatch::IntegrationTest
  test "should get success" do
    get recipe_success_url
    assert_response :success
  end

  test "should get fail" do
    get recipe_fail_url
    assert_response :success
  end

  test "should get index" do
    get recipe_index_url
    assert_response :success
  end

end
