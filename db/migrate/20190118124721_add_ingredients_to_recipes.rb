class AddIngredientsToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :ingredients, :text, null: false, default: ''
  end
end
