Rails.application.routes.draw do
  resources :favorites
  
  resources :users, only: [:index, :create]
  post '/login', to: 'authentication#login'
  
  resources :activities, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
