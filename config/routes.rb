Rails.application.routes.draw do
  resources :ratings
  get 'recipe_image/new'

  get 'recipe_image/delete'
  get 'recipes/:id/mail' => 'recipes#mail', :as => 'mail_recipe'
  get 'recipes/:id/spam' => 'recipes#spam', :as => 'spam_recipe'
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
  resources :tags
  resources :tags_recipes
  resources :measurements
  resources :recipes
  resources :recipe_images
  resources :recipe_ratings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
