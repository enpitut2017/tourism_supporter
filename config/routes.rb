Rails.application.routes.draw do

  get 'users/new'

  root 'spots#index'

  resources :spots, shallow: true do
    resources :mylists, only: [:create, :destroy], formats: 'js'
    resources :advices, shallow: true do
      resources :likes, only: [:create, :destroy], formats: 'js'
      resources :comments, only: [:create, :destroy, :update]
    end
  end
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/signup',  to: 'users#new'
  get    '/mylists', to: 'mylists#index'

  resources :users


end
