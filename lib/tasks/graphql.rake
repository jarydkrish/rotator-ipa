# frozen_string_literal: true

require 'graphql/rake_task'

GraphQL::RakeTask.new(
  # rubocop:disable Style/Lambda
  load_schema: ->(_task) {
    require File.expand_path('../../config/environment', __dir__)
    RotatorIpaSchema
  }
  # rubocop:enable Style/Lambda
)
