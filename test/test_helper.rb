# frozen_string_literal: true

require 'simplecov'
SimpleCov.start 'rails' do
  add_group 'Dashboards', 'app/dashboards'
  add_group 'Fields', 'app/fields'
  add_group 'GraphQL', 'app/graphql'
  enable_coverage :branch
end

if ENV['CI'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: 1)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all
  end
end
