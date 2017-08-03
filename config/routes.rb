Rails.application.routes.draw do

  get 'advices/new'
  get 'spots/show'
  get 'spots/index'
  resources :spots
  resources :advices
  root 'spots#index'

end
