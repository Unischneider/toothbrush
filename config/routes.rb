Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'about', to: 'pages#about', as: :about
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :toothbrushes do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show, :destroy, :update] do
      resources :reviews, only: [:create, :index, :show]
    end

  namespace :my do
    resources :toothbrushes, only: [:index]
    resources :bookings, only: [:index, :update]
  end

  resources :users, only: [:show, :edit, :update]

end
