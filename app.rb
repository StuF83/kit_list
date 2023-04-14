# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require_relative 'models/user.rb'
require_relative 'models/activity.rb'

set :database, {adapter: "sqlite3", database: 'db/development.sqlite3'}

get '/' do
  "Hello World"
end
