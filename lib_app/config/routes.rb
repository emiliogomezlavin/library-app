Rails.application.routes.draw do
  root to: 'users#index'
  resources :users
  resources :libraries

  get '/login', to: "sessions#new"
  post '/sessions', to: "sessions#create"

  get '/users/:user_id/libraries', to: "library_users#index", as: "user_libraries"
  post '/users/:library_id/users', to: "library_users#create", as: "library_users"

end
