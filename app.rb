# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require_relative 'models/user'
require_relative 'models/activity'
require_relative 'models/item'

set :database, { adapter: 'sqlite3', database: 'db/development.sqlite3'}

configure do
  enable :sessions
end

def initialize
  super
  @items_to_pack = []
end

get '/' do
  erb :index, locals: { user: session[:user] }
end

get '/landing' do
  erb :landing
end

post '/login' do
  session[:email] = params[:email]
  session[:password] = params[:password]
  redirect back unless User.exists?(email: session[:email])
  redirect back unless User.find_by(email: session[:email]).password == session[:password]
  session[:user] = User.find_by(email: session[:email])
  session[:items_to_pack] ||= @items_to_pack
  redirect '/'
end

post '/new_activity' do
  activity = params[:activity]
  user = session[:user]
  user.add_activity(activity)
  redirect back
end

get '/item_request' do
  # what we need to do here is have an item list as an instance variable for the user.
  # As the request comes in, we either add or remove the items from the list instance variable.
  # the instance variable should be an array of arrays.
  # the first item of the array is the acitivity name, the subsequent items are the 'items'.
  # as the param[:name] comes in, we can compare the name against the first item in each array (ie activity name)
  # and either add or subtract depending on it's existance.
  activity = params[:name]
  user = session[:user]
  p activity_name = user.activities.find_by(name: activity).name
  p activity_items = user.activities.find_by(name: activity).items_array
  p @items_to_pack
  p user.add_items_to_pack(activity_name, activity_items)
  p @items_to_pack << user.add_items_to_pack(activity_name, activity_items)
  @items_to_pack.to_json
  # activity = user.activities.find_by(name: activity)
  # p activity.items_array
  # user.add_items_to_pack(activity.name, activity.items_array)
  # p user.items_to_pack.to_json
end
