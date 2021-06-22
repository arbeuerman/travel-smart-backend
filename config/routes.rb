Rails.application.routes.draw do
  get 'travel/location'

  # post '/favorites/:location', to: 'favorites#create'
  delete '/favorites', to: 'favorites#delete'
  resources :favorites, only: [:index, :create]
  
  # patch '/users/:id', to: 'users#edit'
  resources :users, only: [:index, :create, :update]
  get '/profile', to: 'users#profile'
  
  post '/login', to: 'authentication#login'
  # delete '/logout', to: 'authentication#logout'
  
  get '/activities/:location', to: 'travel#location'
  resources :activities, only: [:index]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
