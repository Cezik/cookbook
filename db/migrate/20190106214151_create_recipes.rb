class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title, null: false, index: { unique: true }
      t.text :recipe_text, null: false
      t.integer :difficult, null: false
      t.string :photo_path, null: false
      t.integer :likes, default: 0, null: false
      t.integer :hates, default: 0, null: false
      t.references :food_category, foreign_key: true, null: false
      t.timestamps
    end
  end
end
