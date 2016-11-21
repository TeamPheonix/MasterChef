json.extract! recipe, :id, :recipe_id, :user_id, :recipe_name, :instructions, :complexity, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)