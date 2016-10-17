ENV['RACK_ENV'] = 'test'

require_relative './server.rb'
require 'test/unit'
require 'rack/test'

class DataServerTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    DataServer
  end

  def test_it_says_data_server
    puts 'RUNNING'
    get '/'
    assert last_response.ok?
    assert_equal 'Welcome to DataServer', last_response.body
  end

  def test_it_serves_set
    get '/set'
    assert last_response.ok?
  end

  def test_it_serves_get
    get '/get'
    assert last_response.ok?
  end

end
