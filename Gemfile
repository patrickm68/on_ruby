source "http://rubygems.org"
ruby "2.1.1"

gem "foreman",                "~> 0.63"
gem "unicorn",                "~> 4.8.0"
gem "rails",                  "~> 4.0.5"
gem "rails-observers",        "~> 0.1.2"
gem "pg",                     "~> 0.17.1"
gem "rack-cache",             "~> 1.2"
gem "slim-rails",             "~> 2.0"
gem "redcarpet",              "~> 3.0"
gem "friendly_id",            "~> 5.0.2"
gem "omniauth",               "~> 1.2.1"
gem "omniauth-twitter",       "~> 1.0.1"
gem "omniauth-github",        "~> 1.1.2"
gem "ri_cal",                 "~> 0.8.8"
gem "decent_exposure",        "~> 2.3.1"
gem "geocoder",               "~> 1.1"
gem "acts_as_api",            "~> 0.4.2"
gem "whitelabel",             "~> 0.2.0"
gem "exception_notification", "~> 4.0.1"
gem "feedjira",               "~> 1.2"
gem "formtastic",             "~> 2.2.1"
gem "kaminari",               "~> 0.15.0"
gem "typus",                  github: "typus/typus"
gem "jquery-rails",           "~> 3.0"
gem "sass-rails",             "~> 4.0.3"
gem "compass-rails",          "~> 2.0.0"
gem "coffee-rails",           "~> 4.0.1"
gem "font-awesome-rails",     "~> 4.0"
gem "uglifier",               "~> 2.5.0"
gem "newrelic_rpm",           "~> 3.9"
gem "peek",                   "~> 0.1.8"
gem "peek-pg",                "~> 1.1.0"
gem "peek-dalli",             "~> 1.1.2"
gem "peek-gc",                "~> 0.0.2"
gem "peek-git",               "~> 1.0.2"
gem "peek-performance_bar",   "~> 1.1.3"

group :production, :caching do
  gem "heroku-deflater",  "~> 0.5.3"
  gem "rails_12factor",   "~> 0.0.2"
  gem "dalli",            "~> 2.7.0"
  gem "kgio",             "~> 2.9.2"
  gem "lograge",          "~> 0.3.0"
end

group :development do
  gem "partially_useful"
end

group :development, :test do
  gem "spring"
  gem "spring-commands-rspec"
  gem "letter_opener"
  gem "faker"
  gem "pry-rails"
  gem "pry-remote"
  gem "pry-nav"
  gem "rspec-rails",  "~> 2.14"
  gem "rspec-collection_matchers"
  gem "factory_girl_rails"
  gem "meta_request"
  gem "better_errors"
  gem "binding_of_caller"
  gem "quiet_assets"
  gem "codeclimate-test-reporter", require: false
end
