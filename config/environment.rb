# frozen_string_literal: true

configure do
  enable :sessions
end

configure :development do
  set :database, { adapter: 'sqlite3', database: 'db/development.sqlite3' }
end

configure :production do
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
end
