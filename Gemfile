source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.3'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# JSON serializer
gem 'alba'

# factory_bot
gem 'factory_bot_rails'

# Authentication
gem 'sorcery'

# JSON Web Tokens
gem 'jwt'

# upload image file
gem 'carrierwave', '>= 3.0.0.beta', '< 4.0'

# proveider to use AWS
gem 'fog-aws'

# i18n
gem 'rails-i18n', '~> 7.0.0'

# GoogleAuth
gem 'googleauth'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 6.0.0'
  gem 'dotenv-rails'
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-checkstyle_formatter'
  gem 'faker'
  gem 'bullet'
end

group :development do
  gem 'annotate'
end

group :test do
  gem 'capybara'
  gem 'webdrivers'
end

# Rails7.1に導入されるActionCableのリカバリー用のGem
# https://github.com/anycable/action-cable-redis-backport
gem 'action-cable-redis-backport'
