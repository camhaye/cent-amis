Rails.application.routes.draw do
  devise_for :users
  root to: "friends#index"
  resources :friends do
    resources :bookings, only: [:new, :create]
    member do
      match 'toggle_favorite', to: 'friends#toggle_favorite', via: [:get, :post]
    end
  end
  resources :bookings, only: [:show, :edit, :update, :destroy] do
    resources :reviews, only: [:new, :create]
    member do
      patch 'confirm'
    end
  end

  get 'dashboard/my_friends', to: 'dashboard#my_friends'
  get 'dashboard/my_bookings', to: 'dashboard#my_bookings'
  get 'dashboard/my_booked_friends', to: 'dashboard#my_booked_friends'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
