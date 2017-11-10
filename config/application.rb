require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RustyShop
  class Application < Rails::Application
    config.assets.precompile << 'delayed/web/application.css'
    config.active_record.raise_in_transactional_callbacks = true

    config.time_zone = 'Arizona'
  end
end
