class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  # impressionist :unique => [:session_hash]
  # impressionist actions: :show
  # GET /recipes
  # GET /recipes.json
  def index
    #finding recipes by clicking tags
    if params[:tag]
      @tagged_id = TagsRecipe.where(tag_id: params[:tag])
      i = 0
      recipeid = []
      until i == @tagged_id.size
        recipeid[i] = @tagged_id[i].recipe_id
        i = i+1
      end
      @recipes = Recipe.where(id: recipeid)
    else
      @recipes = Recipe.all
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    impressionist(@recipe)
    @tags_recipes = TagsRecipe.all
    @recipe_images = @recipe.recipe_images #returns an array of images for the current recipe
    @tags_recipe = TagsRecipe.new
    @tag = Tag.all
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @tags_recipe = TagsRecipe.new
    @tag = Tag.all
    current_user
  end

  # GET /recipes/1/edit
  def edit
  #   implicit @recipe created because of link
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if current_user.recipes << @recipe
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:recipe_name, :instructions, :complexity, :image)
    end
end


