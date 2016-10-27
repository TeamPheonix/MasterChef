Rails.application.routes.draw do
  #login routes
  get 'access/login'
  get 'access/logout'
  get 'access/logintest'
  post 'access/attempt_login'

  resources :users
  # root :to => 'boostrap#index'
  get 'boostrap/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
