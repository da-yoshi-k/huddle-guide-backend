Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins Rails.application.config.x.cors_allowed_origins, Rails.application.config.x.cors_allowed_dev_origins

    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head],
             credentials: true
  end
end
