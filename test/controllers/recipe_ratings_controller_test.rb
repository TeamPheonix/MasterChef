require 'test_helper'

class RecipeRatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe_rating = recipe_ratings(:one)
  end

  test "should get index" do
    get recipe_ratings_url
    assert_response :success
  end

  test "should get new" do
    get new_recipe_rating_url
    assert_response :success
  end

  test "should create recipe_rating" do
    assert_difference('RecipeRating.count') do
      post recipe_ratings_url, params: { recipe_rating: { comment: @recipe_rating.comment, rating: @recipe_rating.rating, recipe_id: @recipe_rating.recipe_id, user_id: @recipe_rating.user_id } }
    end

    assert_redirected_to recipe_rating_url(RecipeRating.last)
  end

  test "should show recipe_rating" do
    get recipe_rating_url(@recipe_rating)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipe_rating_url(@recipe_rating)
    assert_response :success
  end

  test "should update recipe_rating" do
    patch recipe_rating_url(@recipe_rating), params: { recipe_rating: { comment: @recipe_rating.comment, rating: @recipe_rating.rating, recipe_id: @recipe_rating.recipe_id, user_id: @recipe_rating.user_id } }
    assert_response :success
  end

  test "should destroy recipe_rating" do
    assert_difference('RecipeRating.count', -1) do
      delete recipe_rating_url(@recipe_rating)
    end

    assert_redirected_to recipe_ratings_url
  end
end
