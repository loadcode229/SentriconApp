Rails.application.routes.draw do

  resources :user_accounts, only: [:create]

  resources :users, only: [:show]
  get '/sign_up', to: "users#new"
  post '/sign_up', to: "users#create"

  #root route
  root 'users#show'

  get '/sign_in', to:  "sessions#new"
  get '/auth/facebook/callback' => 'sessions#facebook'
  post '/sign_in', to: "sessions#create"
  get '/sign_out', to: "sessions#destroy"

  #get 'meetups', to: "meetups#all"

  #post 'meetups/day_select', to: "meetups#day_select"
  #post 'user_group/comment', to: "user_groups#comment"

  #resources :groups do
  #  resources :meetups
  #end

  resources :accounts
  resources :user_accounts
end