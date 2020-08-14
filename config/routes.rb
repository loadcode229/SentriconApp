Rails.application.routes.draw do
  #root
  root 'welcome#home'
  
  #session routes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'
  
  resources :users
  resources :accounts
  resources :stations
end
