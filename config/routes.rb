Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "player_performance#index"
  resources :teams
  resources :seasons
  resources :players
  resources :player_performance
end
