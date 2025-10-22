Rails.application.routes.draw do
  resources :products, only: [:index, :new, :create, :destroy]
  resource :cart, only: [:show]
  resources :cart_items, only: [:create, :destroy]
  root "products#index"
end
