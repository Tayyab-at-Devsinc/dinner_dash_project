Rails.application.routes.draw do
  resources :products, :categories, :orders

  devise_for :users

  get 'home/index'
  get 'carts/show'

  get 'cart' => 'carts#show', as: 'cart'
  delete 'cart' => 'carts#destroy', as: 'cart_delete'

  # Cart routes
  post 'line_items/:id/add' => 'line_items#add_quantity', as: 'line_item_add'
  post 'line_items/:id/reduce' => 'line_items#reduce_quantity', as: 'line_item_reduce'
  post 'line_items' => 'line_items#create'
  get 'line_items/:id' => 'line_items#show', as: 'line_item'
  delete 'line_items/:id' => 'line_items#destroy'

  post 'filter_products', to: 'products#filter', as: 'filter_products'


  get 'retire_product/:id', to: 'products#retire_product', as: 'retire_product'
  get 'resume_product/:id', to: 'products#resume_product', as: 'resume_product'

  get 'orders_dashboard', to: 'orders#orders_dashboard', as: 'orders_dashboard'

  root to: 'home#index'

  namespace :api do
    namespace :v1 do
      resources :products
      resources :line_items
    end
  end
end
