Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :cars, only: [:index, :show]
  get "/dashboard", to: "pages#dashboard"
end
