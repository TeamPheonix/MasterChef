class AddImageNameToRecipeImages < ActiveRecord::Migration[5.0]
  def change
    add_column :recipe_images, :image_name, :string
  end
end
