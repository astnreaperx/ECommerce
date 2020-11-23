Rails.application.routes.draw do
  devise_for :customers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "page#index"
  get "/home", to: "page#index", as: "home"

  get "/products", to: "products#index", as: "products"
  get "/product/:id", to: "products#show", as: "product"

  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  delete 'products/remove_from_cart/:id', to: 'products#remove_from_cart', as: 'remove_from_cart'

  get "/categories", to: "categories#index", as: "categories"
  get "/category/:id", to: "categories#show", as: "category"

  get "/woodworkers", to: "woodworker#index", as: "woodworkers"
  get "/woodworker/:id", to: "woodworker#show", as: "woodworker"

  get "/contact", to: "page#contact", as: "contact"
  get "/about", to: "page#about", as: "about"
end
