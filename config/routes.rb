Rails.application.routes.draw do
  resources :games

  get "/", to: "games#index"
end
