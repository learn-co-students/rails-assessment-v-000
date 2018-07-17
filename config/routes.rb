Rails.application.routes.draw do
  resources :games, only: [:index, :show, :new, :create] do
    collection do
      get 'most_popular'
    end
    resources :guides
  end
  resources :users

  root 'welcome#home'
  get '/users/:id/guides' => 'users#guides'

  get '/auth/github/callback' => 'sessions#create'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/games/most_popular' => 'games#most_popular'
end
