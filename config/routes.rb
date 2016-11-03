Rails.application.routes.draw do
  resources :tags
  resources :tags_recipes
  resources :measurements
  resources :recipe_ratings
  resources :recipes
  get 'recipes/success'

  get 'recipes/failed'

  get 'recipes/index'

  root 'welcome#index'
  get 'welcome/about'
  #login routes
  get 'sessions/psuedo_destroy'
  get 'sessions/destroy'
  get 'auth/:provider/callback', to: 'sessions#new'
  get '/sessions/login'
  post 'sessions/create'
  post '/sessions/attempt_login'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
