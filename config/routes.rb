Rails.application.routes.draw do
  root 'application#index'
get "/home", to: "application#home"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:index, :show] do
    resources :workouts, only: [:index, :show]
  end

  resources :workouts
  resources :favorites, only: [:index]
  post "/favorites/new", to: "favorites#new"

  end
