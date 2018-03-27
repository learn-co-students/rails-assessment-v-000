Rails.application.routes.draw do
  root 'application#index'

  get "/home", to: "application#home"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:index, :show] do
    resources :workouts, only: [:index, :show, :new, :edit]
  end

  resources :workouts

  post "/favorites/new", to: "favorites#new"
  post "/users/find", to: "users#find"

end
