require 'sinatra/base'

class DataServer < Sinatra::Base
  set :port, 4000

  get '/' do
    'Welcome to DataServer'
  end

  run! if app_file == $0

end
