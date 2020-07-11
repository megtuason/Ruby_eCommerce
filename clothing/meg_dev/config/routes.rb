Rails.application.routes.draw do
  resources :admins
  resources :products
  resources :tags
  resources :types
  resources :product_tags
  resources :orders
  resources :order_lines
  get 'welcome/about', to: 'welcome#about'
  get 'welcome/contact', to: 'welcome#contact'
  get 'welcome/products', to: 'welcome#storefront'
  get 'welcome/products/tops', to: 'welcome#tops'
  get 'welcome/products/bottoms', to: 'welcome#bottoms'
  get 'welcome/products/dresses', to: 'welcome#dresses'
  get 'welcome/products/accessories', to: 'welcome#acc'
  get 'welcome/index', to: 'welcome#index'
  get 'welcome/cart', to: 'welcome#cart'
  get 'welcome/show', to: 'welcome#show'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  root to: "welcome#home"
end
