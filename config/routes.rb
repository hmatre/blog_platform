Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  root 'posts#index'
  get '/tags/:tag', to: 'posts#index', as: :tag
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :admin, only: [] do
    collection do
      get 'dashboard', to: 'admin#dashboard'
    end
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
