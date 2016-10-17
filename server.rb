require 'sinatra/base'

class DataServer < Sinatra::Base
  set :port, 4000

  memory_data = {}

  get '/' do
    'Welcome to DataServer'
  end

  get '/set' do
    memory_data.merge!(params)
    params #this is here so I can test the params and just because it's nice to
            #have a visual confirmation of the params :)
  end

  get '/get' do
    key = params[:key]
    memory_data[key]
  end

  run! if app_file == $0
end
