Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }
  resources :users
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  root "home#index"

  namespace :clients do
    root "home#index"
  end

  namespace :admins do
    root "home#index"
  end

  namespace :executors do
    root "home#index"
  end
end
