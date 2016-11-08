json.extract! user, :id, :user_name, :password, :first_name, :last_name, :email, :privileges, :user_level, :points, :created_at, :updated_at
json.url user_url(user, format: :json)