Rails.application.routes.draw do
  get 'travel/location'

  # post '/favorites/:location', to: 'favorites#create'
  delete '/favorites', to: 'favorites#delete'
  resources :favorites, only: [:index, :create]
  
  resources :users, only: [:index, :create]
  get '/profile', to: 'users#profile'
  
  post '/login', to: 'authentication#login'
  
  get '/activities/:location', to: 'travel#location'
  resources :activities, only: [:index]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
