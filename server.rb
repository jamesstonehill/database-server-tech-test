require 'sinatra/base'

class DataServer < Sinatra::Base
  set :port, 4000

  memory_data = {}

  get '/' do
    'Welcome to DataServer'
  end

  post '/set' do
    # puts "PARAMS"
    # puts params
    memory_data.merge!(params)
    # puts "DATA"
    # puts memory_data
    params #this is here so I can test the params
  end

  get '/get' do
    key = params[:key]
    memory_data[key]
  end

  run! if app_file == $0
end
