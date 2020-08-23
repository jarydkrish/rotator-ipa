Rails.application.routes.draw do
  root 'pages#home'
  resources :posts, only: [:index, :show]

  devise_for :users
  namespace :admin do
    # Add dashboard for your models here
    resources :posts
    resources :users

    root to: "users#index" # <--- Root route
  end
end
