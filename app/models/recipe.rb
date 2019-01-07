class Recipe < ApplicationRecord
  belongs_to :food_category

  validates :title, :recipe_text, :difficult, :photo_path, :food_category_id, presence: true

  validate :capitalize_fist_char, if: :title

  private

  def capitalize_fist_char
    title[0] = title[0].capitalize
    title
  end
end
