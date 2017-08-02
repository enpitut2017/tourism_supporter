Rails.application.routes.draw do
  get '/detail', to: 'app#detail'
  root 'app#detail'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
