Rails.application.routes.draw do

  resources :homes, only: [:index]
    get '/homes/wiki' => "homes#wiki"

  root to: "homes#index"
end
