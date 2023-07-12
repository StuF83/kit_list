rackup DefaultRackup
port ENV['PORT'] || 4567
environment ENV['RACK_ENV'] || 'development'
