Rails.application.routes.draw do
  get 'cars/index'
  get 'cars/show'
  devise_for :users
  root to: 'pages#home'
  resources :cars, only: [:index, :show]
end
