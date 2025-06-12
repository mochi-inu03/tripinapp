Rails.application.routes.draw do
  
  devise_for :users
  resources :spots, only: [:index, :new, :create, :show ]
end
