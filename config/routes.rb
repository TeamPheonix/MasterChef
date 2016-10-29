Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/about'
  #login routes
  get 'sessions/psuedo_destroy'
  get 'sessions/destroy'
  get 'auth/:provider/callback', to: 'sessions#new'
  post 'sessions/create'

  #login routes
  get 'sessions/login'
  post 'sessions/attempt_login'


  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
