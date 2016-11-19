require 'test_helper'

class RecipeImageControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get recipe_image_new_url
    assert_response :success
  end

  test "should get delete" do
    get recipe_image_delete_url
    assert_response :success
  end

end
