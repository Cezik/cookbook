class Recipe < ApplicationRecord
  belongs_to :food_category

  validates :title, :recipe_text, :difficult, :photo_path, :food_category_id, presence: true
  validates :title, uniqueness: true
  validates :title, length: { minimum: 5 }

  validate :capitalize_fist_char, if: :title

  private

  def capitalize_fist_char
    if title.length > 0
      title[0] = title[0].capitalize
    end
    title
  end
end
