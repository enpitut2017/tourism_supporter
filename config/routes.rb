Rails.application.routes.draw do
  root 'spots#show'

  get 'advices/new', to: 'advices#new'

  get 'spots/show', to: 'spots#show'

  resources :advices


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
