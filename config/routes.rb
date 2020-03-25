Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'signup', to: 'users#new'
  resources :users do
    member do
      get :oubos
    end
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :requests, only: [:new, :show, :create, :destroy] do
    member do
      get :comes
      post :agree
      get :new_report
      post :send_report
      get :modification
      post :send_modification
      post :finish
    end
  end


  get "online", to: "onlines#index"
  get "offline", to: "offlines#index"

  resources :messages, only: [:index, :show, :create, :destroy]
  resources :exchanges, only: [:index, :show, :create, :destroy]
  resources :charges
end
