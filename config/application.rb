# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
require 'good_job/engine'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RotatorIpa
  # Main application. Powers all the magic
  class Application < Rails::Application
    config.time_zone = 'Central Time (US & Canada)'
    config.load_defaults 6.1
    config.generators.assets = false
    config.generators.helper = false
    config.assets.css_compressor = nil
    config.active_job.queue_adapter = :good_job
  end
end
