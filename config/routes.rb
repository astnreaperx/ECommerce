Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "page#index", as: "home"
  get "/page", to: "page#index", as: "Home"

  get "/products", to: "products#index", as: "products"
  get "/product/:id", to: "products#show", as: "product"

  get "/categories", to: "categories#index", as: "categories"
  get "/category/:id", to: "categories#show", as: "category"

  get "/woodworkers", to: "woodworkers#index", as: "woodworkers"
  get "/woodworker/:id", to: "woodworkers#show", as: "woodworker"
end
