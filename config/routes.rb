Rails.application.routes.draw do
  root 'spots#index'

  resources :spots do
    resources :advices, shallow: true
  end

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
