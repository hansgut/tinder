Rails.application.routes.draw do
  resources :profiles, only: [:edit, :update]
  devise_for :users, controllers: { registrations: "registrations" }
  get "/search", to: "search#index"
  resources :likes, only: [:index, :create]
  resources :matches, only: [:index]

  # Defines the root path route ("/")
  root "home#index"
end
