# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require_relative 'models/user.rb'
require_relative 'models/activity.rb'
require_relative 'models/item.rb'

set :database, {adapter: "sqlite3", database: 'db/development.sqlite3'}

get '/' do
  erb :index
end

post '/new_activity' do
  activity = params[:activity]
  user = User.first
  Activity.create(name: activity, user: user)
  redirect back
  erb :index
end
