Rails.application.routes.draw do

  get 'sessions/new'

  root 'spots#index'

  resources :spots do
    resources :advices, shallow: true
  end

end
