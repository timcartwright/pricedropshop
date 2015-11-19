Rails.application.routes.draw do

  root 'products#index'

  devise_for :users

  resources :orders
  resources :products 
  resources :orderitems
  resources :charges
  
end
