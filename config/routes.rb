Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/dashboard", to: "pages#dashboard"
  resources :bookings, only: [:show,:new, :create] do
    resources :payments, only: :new
  end
  resources :cars
end
