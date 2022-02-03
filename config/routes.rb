Rails.application.routes.draw do
  resources :carts, only: [:index, :show, :update]

  root to: "carts#index"
end
