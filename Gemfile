# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'rails', '~> 6.1'

gem 'administrate'
gem 'administrate-field-active_storage'
gem 'api-pagination'
gem 'aws-sdk-s3', require: false
gem 'barnes'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise'
gem 'friendly_id'
gem 'good_job'
gem 'graphql'
gem 'hiredis'
gem 'hotwire-rails'
gem 'image_processing'
gem 'jbuilder'
gem 'kaminari'
gem 'pg', '< 2.0'
gem 'puma'
gem 'rack-cors'
gem 'redis', '~> 4.0'
gem 'scout_apm'

gem 'webpacker', '6.0.0.beta.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
end

group :development do
  gem 'dotenv-rails'
  gem 'listen', '~> 3.2'
  gem 'solargraph'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'codecov', require: false
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'webdrivers'
end
