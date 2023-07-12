# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.1.2"
gem 'sinatra'
gem 'activerecord'
gem 'sinatra-activerecord'
gem 'rake'

group :production do
  gem 'puma'
  gem 'pg'
end


group :development do
  gem 'thin'
  gem 'sqlite3'
end
