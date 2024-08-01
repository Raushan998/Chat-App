Rails.application.routes.draw do
  root 'rooms#index'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  resources :rooms do
    resources :messages
  end
  resources :users
  # Defines the root path route ("/")
  # root "posts#index"
end
