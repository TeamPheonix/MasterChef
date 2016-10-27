Rails.application.routes.draw do
  resources :users
  # root :to => 'boostrap#index'
  get 'boostrap/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
