Rails.application.routes.draw do
  get 'welcome/index'

  #login routes
  get 'access/login'
  get 'access/logout'
  get 'access/logintest'
  get 'access/obscure_session'
  post 'access/attempt_login'

  resources :users
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
