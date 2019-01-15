class ChangeRecipePhotoPathName < ActiveRecord::Migration[5.2]
  def change
    rename_column :recipes, :photo_path, :image
  end
end
