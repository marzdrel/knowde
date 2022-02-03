Rails.application.routes.draw do
  resources :carts, only: [:index, :show, :edit, :update]

  root to: "carts#index"
end
