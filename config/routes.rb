Rails.application.routes.draw do
  root 'application#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :workouts
  post "/favorites/new", to: "favorites#new"
  get "/profile", to: "application#profile"






  end
