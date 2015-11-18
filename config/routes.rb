Rails.application.routes.draw do

  get 'orders/index'

  get 'orders/edit'

  get 'orders/show'

  root 'home#index'

  devise_for :users
  resources :products
  resources :orders

end
