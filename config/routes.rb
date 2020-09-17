

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'movies/index'
  post 'movies/create'
  get '/show/:id', to: 'movies#show'
  put '/update/:id', to: 'movies#update'
  delete '/destroy/:id', to: 'movies#destroy'
  get 'movies/progress'
  post '/signup', to: 'users#create'
  post '/login', to: 'users#login'
  get '/auto_login', to: 'users#auto_login'
end
