require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RotatorIpa
  class Application < Rails::Application
    config.load_defaults 6.0
    config.generators.assets = false
    config.generators.helper = false
    config.active_job.queue_adapter = :good_job
  end
end
