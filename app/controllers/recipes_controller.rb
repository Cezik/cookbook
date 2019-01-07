class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
    # TODO: no idea what to do
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    # TODO: no idea what to do
  end

  def create
    @foodcategory = FoodCategory.find(params[:food_category_id])
    # @recipe = @foodcategory.Recipe(recipe_params)
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = t('recipe.added_new')
      redirect_to food_category_recipe_path(@foodcategory.id, @recipe.id)
    else
      flash.now[:error] = t('recipe.not_added_new')
      render 'new'
    end
  end

  def update
    if @recipe.update(recipe_params)
      flash[:success] = t('recipe.updated')
      redirect_to food_category_recipe_path(@recipe.id)
    else
      flash.now[:error] = t('recipe.not_updated')
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    flash[:success] = t('recipe.deleted')
    redirect_to food_category_path(@recipe.food_category_id)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :difficult, :photo_path, :food_category_id, :recipe_text, :likes, :hates)
  end
end
