require 'test_helper'

class FoodCategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get food_category_new_url
    assert_response :success
  end

end
