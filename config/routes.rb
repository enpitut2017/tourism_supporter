Rails.application.routes.draw do

  get 'users/new'

  root 'spots#index'

  resources :spots do
    resources :advices, shallow: true do
      resources :likes, only: [:create, :destroy], formats: 'js'
    end
  end

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/signup',  to: 'users#new'
  resources :users
  resources :mylists do
    member do
      post 'create'
    end
  end

end
