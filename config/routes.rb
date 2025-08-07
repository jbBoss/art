Rails.application.routes.draw do
  get "database_viewer/index"
  get "database_viewer/show"
  root "home#index"
  get "home/index"
  resources :ordered_items
  resources :orders
  resources :provinces
  resources :categories
  resources :products
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  get 'cart', to: 'carts#show'

  get 'database_viewer', to: 'database_viewer#index'
  get 'database_viewer/:table_name', to: 'database_viewer#show', as: 'database_table'

  post 'cart/increase/:product_id', to: 'carts#increase_quantity', as: 'cart_increase'
  post 'cart/decrease/:product_id', to: 'carts#decrease_quantity', as: 'cart_decrease'



resources :orders, only: [:new, :create]



resources :orders, only: [:new, :create, :index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  # config/routes.rb

  # Shows the cart contents
  resource :cart, only: [:show]

  # Defines routes for adding/removing items
  # POST /cart/add/:product_id -> adds an item
  # DELETE /cart/remove/:product_id -> removes an item
  post 'cart/add/:product_id', to: 'carts#add_item', as: 'cart_add'
  delete 'cart/remove/:product_id', to: 'carts#remove_item', as: 'cart_remove'


end
