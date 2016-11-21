Rails.application.routes.draw do
  resources :people, only: [:index]
  resources :videos, only: [:show]
  resources :representatives, only: [:show]
end
