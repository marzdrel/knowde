source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

gem "adornable"
gem "bootsnap", require: false
gem "jbuilder"
gem "jsbundling-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.1"
gem "redis", "~> 4.0"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "guard-livereload"
  gem "guard-rails"
  gem "guard-rspec"
  gem "guard-shell"
  gem "terminal-notifier"
  gem "terminal-notifier-guard"
end

group :development do
  gem "faker", require: false
  gem "spring", ">= 4"
  gem "spring-commands-rspec"
  gem "standardrb", require: false
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "factory_bot_rails"
  gem "rspec-forward"
  gem "rspec-rails"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "webdrivers"
  gem "webmock"
end
