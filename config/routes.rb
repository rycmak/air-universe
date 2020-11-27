Rails.application.routes.draw do
  namespace :account do
    get 'galaxies/index'
  end
  root to: 'galaxies#index'

  resources :galaxies, only: [ :index, :show, :destroy, :update ] do
    resources :bookings, only: [ :new, :create ]
  end
  devise_for :users
  resources :users, only: [ :show ] do
    resources :galaxies, only: [ :index, :new, :create, :edit]
  end

  resources :bookings, only: [ :edit, :update, :destroy ] do
    resources :reviews, only: [ :index, :create ]
  end

  # ACCOUNTS
  namespace :account do
    resources :offers, only: [ :index ]
    resources :galaxies, only: [ :index ]
    resources :bookings, only: [ :index ] do
      resources :reviews, only: [ :new ]
    end
  end  

  # QUICK EXPERIENCE ROUTE
  get 'quick_exp', to: 'pages#quick_exp'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
