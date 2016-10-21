require 'sinatra/base'

class DataServer < Sinatra::Base
  set :port, 4000

  memory_data = {}

  get '/' do
    'Welcome to DataServer'
  end

  get '/set' do
    memory_data.merge!(params)
    params #this is here for testing and visual purposes only
  end

  get '/get' do
    memory_data[params[:key]]
  end

  run! if app_file == $0
end
