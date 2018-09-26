Rails.application.routes.draw do
  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => "sessions#destroy"
  resources :posts
  resources :users
  root 'welcome#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
