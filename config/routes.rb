Rails.application.routes.draw do
  root 'application#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get "/users/profile", to: "users#profile"

  resources :users, only: [:index, :show] do
    resources :workouts, only: [:index, :show]
  end

  resources :workouts

  post "/favorites/new", to: "favorites#new"






  end
