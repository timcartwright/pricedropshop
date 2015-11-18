Rails.application.routes.draw do

  root 'products#index'

  devise_for :users

  resources :orders

  resources :products do
    resources :orderitems
  end

end
