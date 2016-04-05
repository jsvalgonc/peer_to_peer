Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  #config.action_mailer.delivery_method = :smtp 
  #config.action_mailer.default_url_options = {:host => 'peer-to-peer-lending-jsvalgonc.c9users.io'}

  #É necessário:
  # Permitir acesso a conta google - https://accounts.google.com/DisplayUnlockCaptcha
  # Permitir acesso a aplicações menos seguras no gmail -https://www.google.com/settings/security/lesssecureapps
  config.action_mailer.default_url_options = { host: '0.0.0.0:8080' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  #port:                 2525,
  port:                 587,
  domain:               'gmail.com',
  user_name:            'jose.j.brito.alves@gmail.com',
  password:             'palavrapasse2',
  #authentication:       'plain',
  authentication:       'login',
  enable_starttls_auto: true  }
  config.web_console.whitelisted_ips = '0.0.0.0/0.0.0.0'

    #:address              => "smtp.live.com",
    #:port                 => "587",
    #:domain               => "mail.live.com",
    #:user_name            => "jsvalgonc@hotmail.com",
    #:password             => "palavrapasse",
    #:authentication       => :plain,
    #:enable_starttls_auto => true
  #JG 21/11/2015 
end
