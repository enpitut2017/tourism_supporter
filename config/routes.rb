Rails.application.routes.draw do

  get 'users/new'

  root 'spots#index'

  resources :spots do
    resources :advices, shallow: true
  end

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/signup',  to: 'users#new'
  resources :users do
    resources :mylists, shallow: true
  end

end
