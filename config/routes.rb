Rails.application.routes.draw do

  get 'spots/show'
  get 'spots/index'
  resources :spots
  root 'spots#index'

end
