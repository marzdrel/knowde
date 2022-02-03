Rails.application.routes.draw do
  resources :barcodes, only: [:index, :show, :update]

  root to: "barcodes#index"
end
