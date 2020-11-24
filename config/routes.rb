Rails.application.routes.draw do
  root to: 'pages#home'
  # get "users/:id/galaxies/new", to: "galaxies#new"
  devise_for :users
  
  resources :users do
    resources :galaxies, only: [ :new, :create ]
  end

  resources :galaxies, only: [ :index, :edit, :show ] do
    resources :bookings, only: [ :new ]
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
