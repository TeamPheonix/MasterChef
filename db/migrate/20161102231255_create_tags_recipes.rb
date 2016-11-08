class CreateTagsRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :tags_recipes do |t|
      t.integer :tag_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
