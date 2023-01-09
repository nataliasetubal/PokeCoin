Rails.application.routes.draw do
  resources :pokemon_sales
  resources :pokemon_purchases
  resources :pokemons
  resources :wallets
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "rails/welcome#index"
end
