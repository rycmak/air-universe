Rails.application.routes.draw do
  root to: 'pages#home'

  resources :galaxies, only: [ :index, :show,  :destroy ] do
    resources :bookings, only: [ :new, :create ]
  end
  devise_for :users
  resources :users, only: [ :show ] do
    resources :galaxies, only: [ :index, :new, :create,]
  end
  resources :bookings, only: [ :edit, :update ]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
