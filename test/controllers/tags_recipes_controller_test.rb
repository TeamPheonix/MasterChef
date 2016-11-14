require 'test_helper'

class TagsRecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tags_recipe = tags_recipes(:one)
  end

  test "should get index" do
    get tags_recipes_url
    assert_response :success
  end

  test "should get new" do
    get new_tags_recipe_url
    assert_response :success
  end

  test "should create tags_recipe" do
    assert_difference('TagsRecipe.count') do
      post tags_recipes_url, params: { tags_recipe: { recipe_id: @tags_recipe.recipe_id, tag_id: @tags_recipe.tag_id } }
    end

    assert_redirected_to tags_recipe_url(TagsRecipe.last)
  end

  test "should show tags_recipe" do
    get tags_recipe_url(@tags_recipe)
    assert_response :success
  end

  test "should get edit" do
    get edit_tags_recipe_url(@tags_recipe)
    assert_response :success
  end

  test "should update tags_recipe" do
    patch tags_recipe_url(@tags_recipe), params: { tags_recipe: { recipe_id: @tags_recipe.recipe_id, tag_id: @tags_recipe.tag_id } }
    assert_redirected_to tags_recipe_url(@tags_recipe)
  end

  test "should destroy tags_recipe" do
    assert_difference('TagsRecipe.count', -1) do
      delete tags_recipe_url(@tags_recipe)
    end

    assert_redirected_to tags_recipes_url
  end
end
