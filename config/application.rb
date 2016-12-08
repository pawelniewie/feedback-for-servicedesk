require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CustomerFeedback
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.action_dispatch.default_headers.merge!({'X-Frame-Options' => 'ALLOWALL'})

    config.action_mailer.default_url_options = { host: Rails.application.secrets.http_host }
    config.action_mailer.delivery_method = :mailgun
    config.action_mailer.deliver_later_queue_name = 'customer-feedback-mailer'
    config.action_mailer.mailgun_settings = {
      api_key: ENV['MAILGUN_KEY'],
      domain: ENV['MAILGUN_DOMAIN']
    }

    config.active_job.queue_adapter = :shoryuken
    config.active_job.queue_name = Proc.new { 'customer-feedback' }
    config.active_job.queue_name_prefix = Rails.env

    config.assets.precompile += ['mailers/survey.css']
  end
end
