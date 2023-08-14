Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # resources :users, only: [:new, :create]
  # root to: 'users#new'  

  resources :users

  post '/addUser', action: :addUser, controller: :users

  get '/addUser', controller: :users, to: 'users#new'


  get '/allUser', action: :all_users, controller: :users, to: 'users#all_users'

  post '/deleteUser/:id', action: :deleteUser, controller: :users

  get '/avg', action: :avg, controller: :users


end
