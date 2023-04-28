# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require_relative 'models/user'
require_relative 'models/activity'
require_relative 'models/item'

set :database, { adapter: 'sqlite3', database: 'db/development.sqlite3'}

# def addItemsToArray(itemObjects)
#   itemNames = []
#   itemObjects.each { |item|  itemNames << item.name }
#   itemNames
# end

def add_items_to_array(item_objects)
  item_names = []
  item_objects.each { |item| item_names << item.name }
  item_names
end

get '/' do
  erb :index
end

post '/new_activity' do
  activity = params[:activity]
  user = User.first
  user.addActivity(activity)
  redirect back
end

get '/item_request' do
  activity = params[:name]
  user = User.first
  activity = user.activities.find_by(name: activity)
  item_objects = activity.items
  add_items_to_array(item_objects).to_json
end
