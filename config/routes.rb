Rails.application.routes.draw do
  resources :products do
    resources :myimages
  end
  resources :categories
  devise_for :users
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

  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
