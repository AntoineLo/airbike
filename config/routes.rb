Rails.application.routes.draw do


  devise_for :users
  resources :users, only: [:show]
  root to: 'pages#home'

  resources :users do
    resources :bikes
    end

  resources :bikes, only: [:index]
end
