Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  resources :users
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :requests, only: [:new, :show, :create, :destroy]
  
  get "online", to: "onlines#index"
  get "offline", to: "offlines#index"
  
  resources :messages, only: [:new, :show, :create, :destroy]
end
