Rails.application.routes.draw do
  get 'sessions/new'

  root to: 'static_pages#home'
  get 'signup',  to: 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts,  only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :users do
    member do
      get :followings
    end

    member do
      get :followers
    end
  end
end
