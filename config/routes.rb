Rails.application.routes.draw do
  root "pages#index"
  resources :members, only: :index
end
