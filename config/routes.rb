Rails.application.routes.draw do
  resources :pokemon_sales
  resources :pokemon_acquisitions
  resources :pokemons
  resources :wallets

  post 'sign_up', to: 'users#create'
  get 'sign_up', to: 'users#new'

  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
