# frozen_string_literal: true
configure do
  enable :sessions
end

# configure :development do
#   set :database, { adapter: 'sqlite3', database: 'db/development.sqlite3' }
# end

configure :production do
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
  # Rails.application.config.after_initialize do
  #   ActiveRecord::Base.connection_pool.disconnect!

  #   ActiveSupport.on_load(:active_record) do
  #     config =  ActiveRecord::Base.configurations[Rails.env] ||
  #               Rails.application.config.database_configuration[Rails.env]
  #     config['pool'] = ENV['DB_POOL'] || ENV['RAILS_MAX_THREADS'] || 5
  #     ActiveRecord::Base.establish_connection(config) # Establish connection is not needed for Rails 5.2+ https://github.com/rails/rails/pull/31241
  #   end
  # end
end

#   db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
#   ActiveRecord::Base.establish_connection(
#     adapter: db.scheme == 'postgres' ? 'postgresql' : db.scheme,
#     host: db.host,
#     username: db.user,
#     password: db.password,
#     database: db.path[1..-1],
#   )
