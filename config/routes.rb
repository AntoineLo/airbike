Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }



  resources :bookings, only: [:destroy, :update]
  resources :bikes, only: [:new, :create, :edit, :update]
  resources :users, only: [:show]



  resources :bikes, only: [:index, :show, :edit, :update] do
    resources :bookings, only: [:new, :create]
  end

  resources :annouces, only: [:show, :new, :create, :edit, :update, :destroy]

end
