require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ibackup
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified
    # here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # don't generate RSpec tests for views and helpers
    config.generators do |g|
      # g.orm :active_record
      # g.template_engine :haml
      g.stylesheets false
      g.javascripts false
      #g.helper false
      g.view_specs false
      g.helper_specs false
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => "spac/factories"
    end

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = "Beijing" #'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
     #config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.paths.add File.join('app', 'grape'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join("app/grape")] + 
                             Dir[Rails.root.join("lib")]
                             Dir[Rails.root.join("lib/ibackup")]
  end
end
