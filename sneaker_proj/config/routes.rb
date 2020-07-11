Rails.application.routes.draw do
  get 'sessions/new'
  resources :sales
  resources :categories
  resources :products
  resources :buyers
  resources :sellers
  resources :admins
  get 'mypurchases', to: 'buyers#purchases'
  get 'myproducts', to: 'sales#own'
  get 'welcome/about', to: 'welcome#about'
  get 'welcome/register', to: 'welcome#register'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  root to: "welcome#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
