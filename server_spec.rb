ENV['RACK_ENV'] = 'test'

require_relative './server.rb'
require 'test/unit'
require 'rack/test'

class DataServerTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    DataServer
  end

  def test_it_says_hello_world
    puts 'RUNNING'
    get '/'
    assert last_response.ok?
    assert_equal 'Hello World', last_response.body
  end


end
