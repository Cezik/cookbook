class Recipe < ApplicationRecord
  belongs_to :food_category

  # validates :title, :recipe_text, :difficult, :photo_path, :food_category_id
end
