Rails.application.routes.draw do
  resources :products, :categories, :orders

  devise_for :users

  get 'home/index'
  get 'carts/show'

  get 'carts/:id' => 'carts#show', as: 'cart'
  delete 'carts/:id' => 'carts#destroy'

  # Cart routes
  post 'line_items/:id/add' => 'line_items#add_quantity', as: 'line_item_add'
  post 'line_items/:id/reduce' => 'line_items#reduce_quantity', as: 'line_item_reduce'
  post 'line_items' => 'line_items#create'
  get 'line_items/:id' => 'line_items#show', as: 'line_item'
  delete 'line_items/:id' => 'line_items#destroy'

  post 'filter_products', to: 'products#filter', as: 'filter_products'

  root to: 'home#index'
end
