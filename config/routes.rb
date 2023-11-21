Rails.application.routes.draw do
  # get 'games/index'
  # get 'games/show'
  # get 'games/new'
  # get 'games/create'
  # get 'games/edit'
  # get 'games/update'
  # get 'games/destroy'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root to: "games#index"
  # Defines the root path route ("/")
  # root "posts#index"
  resources :games do
    resources :bookings, only: [:create]
    resources :reviews, only: [:create]
  end

  get "dashboard", to: "dashboard#index"
  get "my_games", to: "games#my_index"
  get "my_bookings", to: "bookings#my_index"
end
