Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :toothbrushes do
    resources :bookings, only: [:new, :show]
  end
  resources :bookings, only: [:index]
end
