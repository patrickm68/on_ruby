source 'http://rubygems.org'

gem 'rails', '3.0.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3-ruby', :require => 'sqlite3'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
gem "twitter", "~> 1.0.0"
gem "dalli", "~> 1.0.0"
gem "hpricot", "~> 0.8.3"
gem "haml-rails", ">= 0.2"
gem "inherited_resources", ">=1.1.2"
gem "will_paginate", ">=3.0.pre2"
gem "devise", ">=1.1.2"
gem "formtastic", ">=1.1.0"
gem "friendly_id", "~>3.0"
gem "compass", ">= 0.10.5"
gem "hoptoad_notifier", ">=2.3.6"
gem "inploy", ">=1.6.8"

group(:production) do
  gem "newrelic_rpm", ">=2.12.3", :group => :production
end

group(:development, :test) do
  gem "ruby-debug19", :require => "ruby-debug"
  gem "metric_fu", ">=1.5.1"
  gem "rspec", ">=2.0.1"
  gem "rspec-rails", ">=2.0.1"
  gem "remarkable", ">=4.0.0.alpha4"
  gem "remarkable_activemodel", ">=4.0.0.alpha4"
  gem "remarkable_activerecord", ">=4.0.0.alpha4"
  gem "factory_girl_rails"
  gem "rails3-generators", :git => "git://github.com/indirect/rails3-generators.git"
end

group(:cucumber) do
  gem "cucumber", ">=0.6.3"
  gem "cucumber-rails", ">=0.3.2"
  gem "capybara", ">=0.3.6"
  gem "database_cleaner", ">=0.5.0"
  gem "spork", ">=0.8.4"
  gem "pickle", ">=0.4.2"
end

