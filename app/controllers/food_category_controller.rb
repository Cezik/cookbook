class FoodCategoryController < ApplicationController

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
      flash[:success] = 'zapisano'
      redirect_to food_category_index_path
    else
      flash.now[:error] = 'błąd'
      render new
    end
  end

  def edit
    @foodcategory = FoodCategory.find(params[:id])
  end

  def update
    @foodcategory = FoodCategory.find(params[:id])
    if @foodcategory.update(foodcategory_params)
      flash[:success] = 'zaktualizowano'
      redirect_to food_category_index_path
    else
      flash.now[:error] = 'błąd'
      render edit
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
