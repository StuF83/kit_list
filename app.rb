# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require_relative 'models/user.rb'

set :database, {adapter: "sqlite3", database: 'db/development.sqlite3'}

get '/' do
  "Hello World"
end

user = User.new(email: "stu@stu.frew")
p user
