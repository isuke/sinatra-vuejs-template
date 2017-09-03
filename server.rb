require 'sinatra/base'
require "sinatra/reloader"

class Server < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/companies.json' do
    companies = []
    1.upto(50) do |i|
      companies << {
        id: i,
        name: "Company #{i}"
      }
    end
    companies.to_json
  end
end
