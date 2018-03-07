Rails.application.routes.draw do
  root 'application#index'
  resources :users
  resources :attractions

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  post '/rides/new' => 'rides#new'




  end
