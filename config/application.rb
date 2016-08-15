	require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cita
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += %W(#{config.root}/lib)
    config.time_zone = 'Bogota'
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es    
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| "<div class=\"field error\">#{html_tag}</div>".html_safe }
   
   
    config.active_record.raise_in_transactional_callbacks = true
  end
end
