class CreateRecipeRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_ratings do |t|
      t.integer :recipe_id
      t.integer :user_id
      t.string :comment
      t.integer :rating

      t.timestamps
    end
  end
end
