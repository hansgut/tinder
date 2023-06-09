Rails.application.routes.draw do
  resources :profiles, only: [:edit, :update]
  devise_for :users, controllers: { registrations: "registrations" }
  get "/search", to: "search#index"
  resources :likes, only: [:index, :create]
  post "/dislike", to: "likes#dislike"
  resources :matches, only: [:index, :show] do
    resources :messages, only: [:create]
  end

  resources :search_preferences, only: [:edit, :update]

  # Defines the root path route ("/")
  root "search#index"
end
