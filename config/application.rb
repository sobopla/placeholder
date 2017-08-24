require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)
ActionDispatch::Request.send :include, Geocoder::Request

module Placeholder
  class Application < Rails::Application

    config.load_defaults 5.1
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

  end
end
