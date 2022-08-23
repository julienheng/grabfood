Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :restaurants

  resources :restaurants do
    resources :items, only: %i[new create update edit]
  end

  resources :orders, only: %i[new create show edit update destroy]

  resources :orders do
    resources :order_items, only: %i[new create]
  end
  resources :order_items, only: %i[destroy]
end
