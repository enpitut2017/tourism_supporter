Rails.application.routes.draw do
  resources :spots,  only: [:show] #必要に応じてアクションを追加する

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
