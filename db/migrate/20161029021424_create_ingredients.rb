class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.integer :ingredient_id
      t.integer :recipe_id
      t.string :ingredient_name
      t.string :web_link

      t.timestamps
    end
  end
end
