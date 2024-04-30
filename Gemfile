source 'https://rubygems.org'

ruby '3.2.3'

# Rails gems
gem 'rails', '~> 7.1.3'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'puma', '>= 5.0'

# JavaScript and asset handling
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'cssbundling-rails'
gem 'sass-rails', '~> 6.0'

# View Components
gem 'view_component', '~> 3.0'

# Database and caching
gem 'redis', '>= 4.0.1'
gem 'bootsnap', require: false

# Front-end frameworks and utilities
gem 'bulma-rails'
gem 'tzinfo-data', platforms: %i[mswin mswin64 mingw x64_mingw jruby]

# Development and test gems
group :development, :test do
  gem 'debug', platforms: %i[mri mswin mswin64 mingw x64_mingw]
  gem 'annotate'
end

group :development do
  gem 'web-console'
  gem 'error_highlight', '>= 0.4.0', platforms: [:ruby]
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rspec-viewcomponent'
end

