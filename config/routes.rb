Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/about'
  #login routes
  get 'sessions/psuedo_destroy'
  post 'sessions/create'
  get 'auth/:provider/callback', to: 'sessions#new'
  delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
