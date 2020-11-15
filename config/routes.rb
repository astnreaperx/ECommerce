Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "page#index"

  get "/product", to: "products#index", as: "products"
  get "/product/:id", to: "products#show", as: "products", constraints: { id: /\d+/ }
end
