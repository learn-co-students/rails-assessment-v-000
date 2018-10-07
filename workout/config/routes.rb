Rails.application.routes.draw do
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  get '/logout' => "sessions#destroy"
  get '/signup' => "users#new"
  resources :users do
    resources :posts
  end
  root 'welcome#home'
  
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/login')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
