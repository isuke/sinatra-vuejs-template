require './static'
require './server'

if ENV["APP_ENV"] == "production"
  run Rack::URLMap.new(
    '/' => Static,
    '/api' => Server,
  )
else
  run Server
end
