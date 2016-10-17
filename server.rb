require 'sinatra/base'

class DataServer < Sinatra::Base
  set :port, 4000

  memory_data = {}

  get '/' do
    'Welcome to DataServer'
  end

  post '/set' do
    puts
    puts "PARAMS"
    puts params
    memory_data.merge!(params)
    puts "DATA"
    puts memory_data
    params #this is here so I can test the params
  end

  get '/get' do
    'No key entered'
  end

  get '/get:key' do
    memory_data[params['key']]
  end

  run! if app_file == $0
end
