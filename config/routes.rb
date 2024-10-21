Rails.application.routes.draw do
    get '/products', to: 'products#index'
    # Add a route for individual product show
    resources :products, only: [:show]
  end
