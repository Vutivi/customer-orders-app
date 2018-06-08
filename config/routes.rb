Rails.application.routes.draw do
  resources :order_details
  resources :regions
  resources :categories
  resources :orders
  resources :products
  resources :suppliers
  resources :employees
  resources :customers
  root 'welcome#index' # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
