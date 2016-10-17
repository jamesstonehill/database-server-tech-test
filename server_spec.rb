ENV['RACK_ENV'] = 'test'

require_relative './server.rb'
require 'test/unit'
require 'rack/test'

class DataServerTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    DataServer.new
  end

  def test_it_says_data_server
    get '/'
    assert last_response.ok?
    assert_equal 'Welcome to DataServer', last_response.body
  end

  # ============= /set tests ===================

  def test_it_serves_set
    post '/set'
    assert last_response.ok?
  end

  def test_set_params
    sample_params = {'somekey' => 'somevalue'}
    post '/set', params=sample_params
    assert last_response.ok?
    # puts "BODY ONE"
    # puts last_response.body
    assert_equal last_response.body, "[\"somekey\", \"somevalue\"]"
  end



# ============= /get tests ===================

  def test_it_serves_get
    get '/get'
    assert last_response.ok?
  end

  # def test_it_returns_error_message_without_any_data
  #   get '/get'
  #   assert_equal last_response.body, 'No key entered'
  # end

  def test_a_single_request
    #tests when you submit an unknown key, it should return a blank string
    get '/get?key=unknownkey'
    assert_equal last_response.body, ''
  end

  # ============= feature tests ===================

  def feature_1
    # tests a situation in which a user submits a post request and then requests
    # that same key on the get url

    my_key = "key1"
    my_value = "value1"
    post "/set?#{my_key}=#{my_value}"


end
