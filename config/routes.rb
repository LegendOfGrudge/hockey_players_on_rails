Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  resources :teams
  resources :seasons
  resources :players
  resources :player_performance
  get "/about", to: "about#index"
  get 'search', to: 'search#search'
end
