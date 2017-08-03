Rails.application.routes.draw do

  get 'advices/new'
  resources :spots
  resources :advices
  root 'spots#index'

  resources :spots do
    resources :advices
  end

  #spots/1/advices/new

end
