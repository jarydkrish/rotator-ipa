Rails.application.routes.draw do
  root 'pages#home'
  resources :posts, only: [:index, :show]

  devise_for :users

  namespace :api do
    resource :beer, only: [:create]
  end

  namespace :admin do
    resources :posts
    resources :users

    root to: "posts#index" # <--- Root route
  end
end
