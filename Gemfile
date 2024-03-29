# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'

gem 'rails', '~> 7'

gem 'administrate'
gem 'administrate-field-active_storage'
gem 'api-pagination'
gem 'aws-sdk-s3', require: false
gem 'barnes'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'cssbundling-rails', '~> 1.1'
gem 'devise'
gem 'friendly_id'
gem 'good_job'
gem 'graphql'
gem 'hiredis'
gem 'image_processing'
gem 'jbuilder'
gem 'jsbundling-rails', '~> 1.0'
gem 'kaminari'
gem 'pg', '< 2.0'
gem 'puma'
gem 'rack-cors'
gem 'redis'
gem 'scout_apm'
gem 'stimulus-rails'
gem 'turbo-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rubocop', require: false
  gem 'rubocop-graphql', require: false
  gem 'rubocop-rails', require: false
end

group :development do
  gem 'dotenv-rails'
  gem 'listen', '~> 3.2'
  gem 'rails-erd', '~> 1.7'
  gem 'solargraph'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'codecov', require: false
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'webdrivers'
end
