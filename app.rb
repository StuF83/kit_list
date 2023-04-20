# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require_relative 'models/user.rb'
require_relative 'models/activity.rb'
require_relative 'models/item.rb'

set :database, {adapter: "sqlite3", database: 'db/development.sqlite3'}

def addItemsToArray(itemObjects)
  itemNames = []
  itemObjects.each { |item|  itemNames << item.name }
  itemNames
end

get '/' do
  erb :index
end

post '/new_activity' do
  activity = params[:activity]
  user = User.first
  p user.items
  user.activities.find_by(name: "swimming").items.each{|item| user.items << item.name}
  p user.items
  # Activity.create(name: activity, user: user)
  redirect back
  # erb :index
end

get '/item_request' do

    # get an array of items
  # we need js to send an http request with a post?? so we can get params?
  # we can do this with a fetch() post request, we don't need to wait for .then as sinatra will be updating the page
  # or do we return a json and use that to update the page? can we do this...? We'd need sinatra to return the json back to the js request, how can we do this?
  activity = params[:name]
  user = User.first
  activity = user.activities.find_by(name: activity)
  itemObjects = activity.items
  addItemsToArray(itemObjects).to_json
end
