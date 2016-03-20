Rails.application.routes.draw do

  resources :game_users, only: [:update]
  resources :games

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root 'games#index'
  
end
