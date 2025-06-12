Rails.application.routes.draw do
  root to: 'spots#index'

  devise_for :users
  resources :spots, only: [:new, :create, :index, :show]
end