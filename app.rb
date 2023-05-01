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
  @user = User.find(session[:user_id])
  erb :index, locals: { user: @user }
end

get '/landing' do
  erb :landing
end

post '/login' do
  session[:email] = params[:email]
  session[:password] = params[:password]
  redirect back unless User.exists?(email: session[:email])
  redirect back unless User.find_by(email: session[:email]).password == session[:password]
  session[:user_id] = User.find_by(email: session[:email]).id
  session[:items_to_pack] ||= @items_to_pack
  redirect '/'
end

get '/new_activity' do
  erb :new_activity
end

post '/new_activity_save' do
  @user = User.find(session[:user_id])
  new_activity_name = params[:new_activity_name]
  @user.activities.create(name: new_activity_name)
  activity = @user.activities.find_by(name: new_activity_name)
  p items = params[:new_activity_items]
  item_array = items.split(/\r\n/)
  item_array.each do |item_name|
    activity.items.create(name: item_name)
  end
  p activity.items
  redirect '/'
end

get '/item_request' do
  activity = params[:name]
  @user = User.find(session[:user_id])
  index = @user.activities.find_by(name: activity).activity_in_packing_list?(@items_to_pack)
  if index
    @items_to_pack.delete_at(index)
  else
    activity_name = @user.activities.find_by(name: activity).name
    activity_items = @user.activities.find_by(name: activity).items_array
    @items_to_pack << @user.add_items_to_pack(activity_name, activity_items)
  end
  @items_to_pack.to_json
end
