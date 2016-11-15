class CreateRecipeImages < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_images do |t|
      t.integer :recipe_id
      t.string :image
      t.timestamps
    end
  end
end
