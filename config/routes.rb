Rails.application.routes.draw do
  resources :accounts_users
  resources :accounts
  resources :users
  resources :stations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
