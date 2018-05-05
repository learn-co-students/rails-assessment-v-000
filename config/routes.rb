Rails.application.routes.draw do
  resources :games, only: [:index, :show, :new, :create] do
    resources :guides
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get '/auth/github/callback' => 'sessions#create'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
