json.extract! tags_recipe, :id, :tag_id, :recipe_id, :created_at, :updated_at
json.url tags_recipe_url(tags_recipe, format: :json)