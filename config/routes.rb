Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'application#welcome'
  get '/auth/facebook/callback' => 'sessions#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  resources :users
end
