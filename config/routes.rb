Rails.application.routes.draw do

  # get 'home/index'
  # get 'home/home'
  # # get 'welcome/home'

  # get "home", to: "home#index", as: "user_root"
  # # root 'home#index'

  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # resources :homes, only: [:index]

  get 'homes/index' => 'homes#index'
  post 'homes/search' => 'homes#search'


  root to: "homes#index"

  # root 'songkicks#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:show, :users, :new]

end
