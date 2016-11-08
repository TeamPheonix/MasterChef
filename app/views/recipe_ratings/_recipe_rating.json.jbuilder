json.extract! recipe_rating, :id, :recipe_id, :user_id, :comment, :rating, :created_at, :updated_at
json.url recipe_rating_url(recipe_rating, format: :json)