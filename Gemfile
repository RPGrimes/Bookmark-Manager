# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

group :test do
  gem 'capybara'
  gem 'sinatra'
  gem 'sinatra-reloader'
  gem 'sinatra-contrib'
  gem 'rspec'
  gem 'rack'
  gem "thin"
  gem "puma"
  gem 'reel'
  gem 'http'
  gem 'webrick'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
  gem 'pg'
end