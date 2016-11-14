class RecipeRatingsController < ApplicationController
  before_action :set_recipe_rating, only: [:show, :edit, :update, :destroy]

  # GET /recipe_ratings
  # GET /recipe_ratings.json
  def index
    @recipe_ratings = RecipeRating.all
  end

  # GET /recipe_ratings/1
  # GET /recipe_ratings/1.json
  def show
  end

  # GET /recipe_ratings/new
  def new
    @recipe_rating = RecipeRating.new
  end

  # GET /recipe_ratings/1/edit
  def edit
  end

  # POST /recipe_ratings
  # POST /recipe_ratings.json
  def create
    @recipe_rating = RecipeRating.new(recipe_rating_params)

    respond_to do |format|
      if @recipe_rating.save
        format.html { redirect_to @recipe_rating, notice: 'Recipe rating was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_rating }
      else
        format.html { render :new }
        format.json { render json: @recipe_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_ratings/1
  # PATCH/PUT /recipe_ratings/1.json
  def update
    respond_to do |format|
      if @recipe_rating.update(recipe_rating_params)
        format.html { redirect_to @recipe_rating, notice: 'Recipe rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_rating }
      else
        format.html { render :edit }
        format.json { render json: @recipe_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_ratings/1
  # DELETE /recipe_ratings/1.json
  def destroy
    @recipe_rating.destroy
    respond_to do |format|
      format.html { redirect_to recipe_ratings_url, notice: 'Recipe rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_rating
      @recipe_rating = RecipeRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_rating_params
      params.require(:recipe_rating).permit(:recipe_id, :user_id, :comment, :rating)
    end
end
