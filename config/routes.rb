Rails.application.routes.draw do
  namespace :api do
    post '/addUser', action: :addUser, controller: :users
  end

  namespace :api do
    get '/avg', action: :avg, controller: :users
  end

  namespace :api do
    post '/deleteUser', action: :deleteUser, controller: :users
  end

end
