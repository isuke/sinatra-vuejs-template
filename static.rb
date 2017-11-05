require 'sinatra/base'

class Static < Sinatra::Base
  configure do
    set :public_dir, File.join(settings.root, 'dist')
  end

  get '/' do
    send_file File.join(settings.public_dir, 'index.html')
  end
end
