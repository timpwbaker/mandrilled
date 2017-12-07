source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap'
gem 'coffee-rails', '~> 4.2'
gem 'hiredis'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jbuilder', '~> 2.5'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rack-mini-profiler'
gem 'rails', '~> 5.1.4'
gem 'redis', '~> 3.0'
gem 'readthis'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'activeresource'

group :development, :test do
  gem "dotenv-rails"
  gem 'capybara'
  gem 'capybara_discoball'
  gem 'chromedriver-helper'
  gem 'database_cleaner', '~> 1.6.0'
  gem 'factory_girl_rails'
  gem 'pry'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'shoulda'
  gem 'sinatra'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem "simplecov", require: false
end
