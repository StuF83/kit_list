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
  activity = params[:name]
  user = session[:user]
  activity_name = user.activities.find_by(name: activity).name
  activity_items = user.activities.find_by(name: activity).items_array
  @items_to_pack << user.add_items_to_pack(activity_name, activity_items)
  @items_to_pack.to_json
end
