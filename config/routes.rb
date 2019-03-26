Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  resources :users, :posts, :tags
  root "posts#index"
  get '/users/:id/settings', to: "users#settings", as: "settings"
  post '/posts/:id', to: "posts#create_like", as: "new_like"

end
