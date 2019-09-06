Rails.application.routes.draw do
  resources :products do
    resources :myimages
  end
  resources :categories
  devise_for :users

  resources :my_shopping_carts, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :payments, only: [:show]

  post "/pay", to: "payments#create"
  get "/checkout", to: "payments#checkout"

  get "/add/:product_id", as: :add_to_cart, to: "my_shopping_carts#create"
  get 'home/search'
  get 'home/index'
  get 'home/purchases'
  get 'home/history'
  get 'home/favorites'
  get 'home/admin'
  get 'home/products'
  get 'home/reputation'
  get 'home/sales'
  get 'home/summary'
  get 'home/car'

  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
