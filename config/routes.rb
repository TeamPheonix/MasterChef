Rails.application.routes.draw do
  #login routes
  get 'access/login'
  get 'access/logout'
  get 'access/logintest'
  post 'access/attempt_login'

  resources :users
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
