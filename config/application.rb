require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ExceptionOnRails
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    ##
    # We can define our own response mapping
    #
    # EX: this will return 400 status code when ActiveRecord::RecordInvalid is thrown
    # config.action_dispatch.rescue_responses = {
    #   "ActiveRecord::RecordInvalid" => :bad_request
    # }
    #
    # List of default codes:
    #     https://github.com/rails/rails/blob/master/activerecord/lib/active_record/railtie.rb#L25
    #     https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/middleware/exception_wrapper.rb#L9

    # Defining our exception application
    config.exceptions_app = -> (env) { ExceptionHandler.call(env) }

    # Need to override ActionDispatch::DebugExceptions
    # in order to bypass the default exception HTML rendering
    config.after_initialize do
      require File.expand_path('../../app/middleware/debug_exceptions', __FILE__)
    end
  end
end
