Rails.application.routes.draw do

  get 'advices/new'
  resources :spots
  resources :advices
  root 'spots#index'

end
