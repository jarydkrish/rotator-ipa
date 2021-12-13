# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'

  # For the robots
  get '/sitemap.xml', to: 'pages#sitemap', format: 'xml'

  resources :beers, only: [:index, :show] do
    member do
      get 'show_description'
    end
  end
  resources :posts, only: [:index, :show]

  devise_for :users, skip: [:registrations]

  namespace :api do
    resource :hourly_data_points, only: [:index, :create]
    resources :beers, only: [:index, :show] do
      resources :hourly_data_points, only: [:index]
    end
  end

  namespace :admin do
    root to: 'beers#index'
    resources :beers
    resources :beer_daily_data_points
    resources :beer_hourly_data_points

    resources :posts
    resources :users
    authenticate :user do
      mount GoodJob::Engine => 'good_job'
    end
  end

  post '/graphql', to: 'graphql#execute'
end
