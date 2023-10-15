Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/teams", to: "teams#index"
  get "/seasons", to: "seasons#index"
  get "/players", to: "players#index"
end
