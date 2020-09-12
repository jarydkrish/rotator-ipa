# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'

  # For the robots
  get '/sitemap.xml', to: 'pages#sitemap', format: 'xml'

  resources :beers, only: [:index, :show]
  resources :posts, only: [:index, :show]

  devise_for :users, skip: [:registrations]

  namespace :api do
    resource :beer, only: [:create]
  end

  namespace :admin do
    root to: 'beers#index'
    resources :beers
    resources :beer_daily_data_points
    resources :beer_hourly_data_points

    resources :posts
    resources :users
  end
end
