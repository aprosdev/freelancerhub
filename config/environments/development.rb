Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  # config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  config.paperclip_defaults = {
    storage: :s3,
    s3_credentials: {
      bucket: ENV["S3_BUCKET_NAME"],
      access_key_id: ENV["AWS_ACCESS_KEY"],
      secret_access_key: ENV["AWS_SECRET_KEY"],
      s3_region: ENV["S3_REGION"],
    }
  }

  # Actionmailer
  config.action_mailer.delivery_method = :sendgrid_actionmailer
  config.action_mailer.sendgrid_actionmailer_settings = {
    api_key: ENV['SENDGRID_API_KEY']
  }
  
  # config.web_socket_server_url = "wss://freelancehub-website-masudhossain.c9users.io/cable"
  # config.action_cable.allowed_request_origins = ['http://freelancehub-website-masudhossain.c9users.io']

  STRIPE_SECRET = ENV["STRIPE_SECRET_KEY"]
  STRIPE_PUBLIC = ENV["STRIPE_PUBLIC_KEY"]

  config.action_cable.allowed_request_origins = ['http://0.0.0.0:3000']

  # config.action_cable.url = ENV["ACTION_CABLE_URL"]
end