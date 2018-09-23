Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'application#welcome'
  get '/auth/facebook/callback' => 'sessions#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :users
  resources :user_time_slots
  resources :users, only: [:show] do
    resources :time_slots, only: [:show, :index, :new, :edit]
  end

  resources :time_slots
end
