Rails.application.routes.draw do
  root 'application#index'
  get "/users/profile", to: "users#profile"

  resources :users, only: [:show, :edit] do
    resources :workouts, only: [:show]
  end


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  resources :workouts
  post "/favorites/new", to: "favorites#new"






  end
