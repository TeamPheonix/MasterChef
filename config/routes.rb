Rails.application.routes.draw do
  resources :tags
  resources :tags_recipes
  resources :measurements
  resources :recipe_ratings
  resources :recipes
  get 'recipes/success'

  get 'recipes/failed'

  get 'recipes/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
