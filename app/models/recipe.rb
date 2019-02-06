class Recipe < ApplicationRecord
  acts_as_votable
  belongs_to :food_category
  belongs_to :user

  mount_uploader :image, DishUploader

  validates :title, :recipe_text, :difficult, :ingredients, :image, :food_category_id, presence: true
  validates :title, uniqueness: true
  validates :title, length: { minimum: 5 }
  validates :ingredients, length: { minimum: 5 }

  before_validation :capitalize_fist_char, if: :title

  def blank_stars
    5 - difficult
  end

  private

  def capitalize_fist_char
    title[0] = title[0].capitalize if title.length.positive?
    title
  end
end
