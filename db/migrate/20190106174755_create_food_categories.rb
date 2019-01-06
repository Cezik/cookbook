class CreateFoodCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :food_categories do |t|
      t.string :title, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
