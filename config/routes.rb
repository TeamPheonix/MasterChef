Rails.application.routes.draw do
  get 'recipes/success'

  get 'recipes/failed'

  get 'recipes/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
match	':controller(/:action(/:id))',	:via	=>	:get
match	':controller(/:action(/:id))',	:via	=>	:post
