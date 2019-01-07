class FoodCategory < ApplicationRecord
  has_many :recipes, dependent: :destroy

  validates :title, presence: true
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
