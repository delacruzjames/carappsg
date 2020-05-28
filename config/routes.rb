Rails.application.routes.draw do
  root "pages#index"
  resources :application_forms, only: [:new, :create, :index]
  resources :members, only: :index
end
