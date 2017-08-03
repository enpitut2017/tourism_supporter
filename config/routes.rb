Rails.application.routes.draw do
  get 'spots/show'
  get 'spots/index'
  resources :spots
  root 'spots#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
