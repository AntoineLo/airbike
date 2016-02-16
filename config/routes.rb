Rails.application.routes.draw do

  # get 'bookings/show'
  # get 'bookings/new'
  # get 'bookings/create'
  # get 'bookings/edit'
  # get 'bookings/update'
  # get 'bookings/destroy'

  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  resources :users, only: [:show] do
    resources :bikes, only: [:new, :create]
  end


  resources :bikes, only: [:index, :show, :edit, :update] do
    resources :bookings, only: [:new, :create]
  end

end
