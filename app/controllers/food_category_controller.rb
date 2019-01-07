class FoodCategoryController < ApplicationController

  before_action :set_foodcategory, only: [:show, :edit, :update, :destroy]

  def show=
    @recipe = @foodcategory.recipes.new
  end

  def index
    @foodcategory = FoodCategory.all
  end

  def new
    @foodcategory = FoodCategory.new
    render
  end

  def create
    @foodcategory = FoodCategory.new(foodcategory_params)
    if @foodcategory.save
      flash[:success] = t('food_category.added_new')
      redirect_to food_category_index_path
    else
      flash.now[:error] = t('food_category.not_added_new')
      render 'new'
    end
  end

  def edit
  end

  def update
    if @foodcategory.update(foodcategory_params)
      flash[:success] = t('food_category.updated')
      redirect_to food_category_index_path
    else
      flash.now[:error] = t('food_category.not_updated')
      render 'edit'
    end
  end

  def destroy
    foodcategory.destroy
    redirect_to foodcategory_path
  end

  private

  def set_foodcategory
    @foodcategory = FoodCategory.find(params[:id])
  end

  def foodcategory_params
    params.require(:food_category).permit(:title)
  end
end
