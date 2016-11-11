class RecipeImagesController < ApplicationController
  def new
    @recipe_image = RecipeImage.new
    @recipe_id = params[:recipe_id]
  end

  def create
    @recipe_image = RecipeImage.new(recipe_image_params)
    recipe = Recipe.find(params[:recipe_id])

    if recipe.recipe_images << @recipe_image
      redirect_to recipe_path(recipe)
    else
      redirect_to root_path
    end
    # need something like current_user
  end

  def delete

  end

  private
    def recipe_image_params
      params.require(:recipe_image).permit(:image)
    end
end
