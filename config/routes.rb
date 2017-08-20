Rails.application.routes.draw do

  get 'home/index'

  get 'welcome/home'

  get "home", to: "home#index", as: "user_root"
  root 'home#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # resources :homes, only: [:index]
  #   get '/homes/wiki' => "homes#wiki"

  # root to: "homes#index"

  # root 'songkicks#index'

end
