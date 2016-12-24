class TagsRecipesController < ApplicationController
  before_action :set_tags_recipe, only: [:show, :edit, :update, :destroy]

  # GET /tags_recipes
  # GET /tags_recipes.json
  def index
    @tags_recipes = TagsRecipe.all
  end

  # GET /tags_recipes/1
  # GET /tags_recipes/1.json
  def show
  end

  # GET /tags_recipes/new
  def new
    @tags_recipe = TagsRecipe.new
  end

  # GET /tags_recipes/1/edit
  def edit
  end

  # POST /tags_recipes
  # POST /tags_recipes.json
  def create
    @tags_recipe = TagsRecipe.new(tags_recipe_params)

    respond_to do |format|
      if @tags_recipe.save
        format.html { redirect_to @tags_recipe, notice: 'Tags added.' }
        format.json { render :show, status: :created, location: @tags_recipe }
      else
        format.html { render :new }
        format.json { render json: @tags_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags_recipes/1
  # PATCH/PUT /tags_recipes/1.json
  def update
    respond_to do |format|
      if @tags_recipe.update(tags_recipe_params)
        format.html { redirect_to @tags_recipe, notice: 'Tags recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @tags_recipe }
      else
        format.html { render :edit }
        format.json { render json: @tags_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags_recipes/1
  # DELETE /tags_recipes/1.json
  def destroy
    if current_user && (current_user == @recipe.user) || is_admin
      @tags_recipe.destroy
      respond_to do |format|
        format.html { redirect_to :back, notice: 'Tag removed.' }
        format.json { head :no_content }
      end
    else
      redirect_to (root_path)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tags_recipe
      @tags_recipe = TagsRecipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tags_recipe_params
      params.require(:tags_recipe).permit(:tag_id, :recipe_id)
    end
end
