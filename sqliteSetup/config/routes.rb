Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/addUser', action: :addUser, controller: :users

  get '/', action: :allUser, controller: :users

  post '/deleteUser/:id', action: :deleteUser, controller: :users

  get '/avg', action: :avg, controller: :users


end
