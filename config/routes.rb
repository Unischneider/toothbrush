Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  get 'about', to: 'pages#about', as: :about
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :toothbrushes do
    resources :bookings, only: [:new, :show, :update, :destroy, :create]
  end
  resources :bookings, only: [:index]
  resources :users, only: [:show, :edit, :update]

end
