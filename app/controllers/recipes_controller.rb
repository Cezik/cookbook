class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :vote]

  def index
    @recipes = Recipe.accessible_by(current_ability, :index)
  end

  def show
    authorize! :show, @recipe
  end

  def new
    @recipe = current_user.recipes.new
    authorize! :new, @recipe
  end

  def edit
    authorize! :edit, @recipe
  end

  def create
    # @recipe = @foodcategory.Recipe(recipe_params)
    @foodcategory = FoodCategory.find(params[:food_category_id])
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    authorize! :create, @recipe
    if @recipe.save
      flash[:success] = t('recipe.added_new')
      redirect_to food_category_recipe_path(@foodcategory, @recipe.id)
    else
      flash.now[:error] = t('recipe.not_added_new')
      render 'new'
    end
  end

  def update
    authorize! :update, @recipe
    if @recipe.update(recipe_params)
      flash[:success] = t('recipe.updated')
      redirect_to food_category_recipe_path(@recipe.id)
    else
      flash.now[:error] = t('recipe.not_updated')
      render 'edit'
    end
  end

  def destroy
    authorize! :destroy, @recipe
    @recipe.destroy
    flash[:success] = t('recipe.deleted')
    redirect_to food_category_path(@recipe.food_category_id)
  end

  def vote
    if request.post?
      @recipe.upvote_by current_user
    elsif request.delete?
      @recipe.downvote_by current_user
    end
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end

  def toprated
    @recipe = Recipe.all
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :difficult, :image, :food_category_id, :recipe_text, :ingredients)
  end
end
