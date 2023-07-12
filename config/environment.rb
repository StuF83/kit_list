# frozen_string_literal: true

set :database_file, '.config/database.yml'

configure do
  enable :sessions
end

# configure :development do
#   set :database, { adapter: 'sqlite3', database: 'db/development.sqlite3' }
# end

# configure :production do

# end

#   db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
#   ActiveRecord::Base.establish_connection(
#     adapter: db.scheme == 'postgres' ? 'postgresql' : db.scheme,
#     host: db.host,
#     username: db.user,
#     password: db.password,
#     database: db.path[1..-1],
#   )
