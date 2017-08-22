Rails.application.routes.draw do

  get 'homes/index' => 'homes#index'
  post 'homes/search' => 'homes#search'
  get 'homes/search', to: redirect('homes/index')

  root to: "homes#index"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:show, :users, :new]

end
