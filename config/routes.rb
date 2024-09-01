Rails.application.routes.draw do
  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :articles
  resources :users
  resources :user_strengths

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "users#index"

  # 静的ページ
  get 'static_pages/info'
  get 'static_pages/terms'
  get 'static_pages/privacy'
  get 'static_pages/faq'
end
