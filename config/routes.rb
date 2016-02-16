Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  devise_for :users
  resources :users, only: [:show]
  root to: 'pages#home'

  resources :users do
    resources :bikes, only: [:new, :create]
  end

  resources :bikes, only: [:index, :show, :edit, :update]

end
