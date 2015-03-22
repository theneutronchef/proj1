Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  patch 'capture', to: 'pokemons#capture'
  patch 'damage', to: 'pokemons#damage'
  patch 'heal', to: 'pokemons#heal'

  get 'levelup', to: 'pokemons#choose'
  patch 'levelup', to: 'pokemons#updateupdate'
  # post 'pokemon/new', to: 'pokemon#create'
  resources :pokemons
end
