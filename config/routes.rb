Rails.application.routes.draw do
  # get "users/:id/galaxies/new", to: "galaxies#new"
  resources :users do
    resources :galaxies, only: [ :new, :create ]
  end
  resources :galaxies, only: [ :index, :edit, :show ]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
