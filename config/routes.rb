Rails.application.routes.draw do
  get 'galaxies/index'
  get 'galaxies/show'
  get 'galaxies/edit'
  devise_for :users 
  resources :users do
    resources :galaxies, only: [ :new, :create ]
  end
  # get "users/:id/galaxies/new", to: "galaxies#new"
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
