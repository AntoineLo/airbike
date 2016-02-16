Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  resources :users, only: [:show] do
    resources :bikes, only: [:new, :create, :edit, :update]
  end

  resources :bikes, only: [:index, :show]

end
