Rails.application.routes.draw do

  root 'products#index'

  devise_for :users

  resources :products do
    resources :orders
  end

end
