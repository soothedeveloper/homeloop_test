Rails.application.routes.draw do
  root 'searches#new'

  resources :queries, only: [:create]

  get :result, to: 'searches#result'
end
