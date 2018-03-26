source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bootsnap"
gem "foreman"
gem "puma"
gem "rails", "5.2.0rc1"
gem "sass-rails", github: "rails/sass-rails"
gem "sqlite3"

gem "coffee-rails"
gem "devise"

gem "jbuilder"
gem "turbolinks"
gem "uglifier"

gem "capistrano-rails", group: :development

gem "awesome_print"
gem "webpacker"
gem "twitter"
gem "loofah", "~> 2.2.1"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "capybara"
  gem "cucumber-rails", require: false
  gem "database_cleaner"
  gem "factory_bot_rails"
  gem "pry-rails"
  gem "pry-rescue"
  gem "rspec-rails"
  gem "rubocop"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
end

group :development do
  gem "listen"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen"
  gem "web-console"
end

group :test do
  gem "webmock"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
