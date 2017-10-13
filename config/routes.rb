Rails.application.routes.draw do

  get 'users/new'

  root 'spots#index'

  resources :spots do
    resources :advices, shallow: true
  end

  get  '/signup',  to: 'users#new'

end
