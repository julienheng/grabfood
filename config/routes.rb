Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #restaurants/id/item/index
  #restaurants/index
  #order/show

  resources :restaurants do
    resources :items, except: :show
  end

  resources :orders, except: :index do
    resources :order_items, only: %i[index new create]
  end

  resources :order_items, only: %i[destroy]
end
