class FoodCategoryController < ApplicationController
  def show
    @foodcategory = FoodCategory.find(params[:id])
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
    @foodcategory = FoodCategory.find(params[:id])
  end

  def update
    @foodcategory = FoodCategory.find(params[:id])
    if @foodcategory.update(foodcategory_params)
      flash[:success] = t('food_category.updated')
      redirect_to food_category_index_path
    else
      flash.now[:error] = t('food_category.not_updated')
      render 'edit'
    end
  end

  def destroy
    foodcategory = FoodCategory.find(params[:id])
    foodcategory.destroy
    redirect_to foodcategory_path
  end

  private

  def foodcategory_params
    params.require(:food_category).permit(:title)
  end
end
