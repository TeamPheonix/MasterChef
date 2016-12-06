class RecipeImagesController < ApplicationController
  def new
    @recipe_image = RecipeImage.new
    @recipe_id = params[:recipe_id]
    if current_user != Recipe.find(@recipe_id).user
      redirect_to recipe_path(@recipe_id)
    end
  end

  def create
    @recipe_image = RecipeImage.new(recipe_image_params)
    @recipe_id = params[:recipe_id]
    recipe = Recipe.find(@recipe_id)
    if recipe.recipe_images << @recipe_image
      redirect_to recipe_path(recipe)
    else
      flash[:recipe_image_create] = 'Please choose an image.'
      render 'recipe_images/new'
    end
  end

  def destroy
    @recipe_image = RecipeImage.find(params[:id])
    @recipe = @recipe_image.recipe
    if @recipe_image.destroy
      # redirect back to the recipe
      redirect_to recipe_path(@recipe), notice: 'Image deleted.'
    else
    end
  end

  private
    def recipe_image_params
      params.permit(:image)
    end
end
