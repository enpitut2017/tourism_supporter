Rails.application.routes.draw do

  root 'spots#index'

  resources :spots do
    resources :advices
  end
end
