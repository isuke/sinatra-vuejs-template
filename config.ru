require './server'
require 'rack-proxy'

class Index
  def call(env)
    [
      200,
      { 'Content-Type' => 'text/html' },
      [File.read('./index.html')]
    ]
  end
end

class AppProxy < Rack::Proxy
  def rewrite_env(env)
    env['HTTP_HOST'] = 'localhost:8080'
    env
  end
end

if ENV["APP_ENV"] == "production"
  run Rack::URLMap.new(
    '/api' => Server,
    '/dist' => Rack::Directory.new("./dist"),
    '/' => Index.new
  )
else
  run Rack::URLMap.new(
    '/api' => Server,
    '/' => AppProxy.new
  )
end
