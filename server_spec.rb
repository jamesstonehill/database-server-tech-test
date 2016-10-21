ENV['RACK_ENV'] = 'test'

require_relative './server.rb'
require 'test/unit'
require 'rack/test'

class DataServerTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    DataServer.new
  end

  def test_it_says_data_server_on_root
    get '/'
    assert last_response.ok?
    assert_equal 'Welcome to DataServer', last_response.body
  end

  # ============= /set tests ===================

  def test_it_serves_set
    get '/set'
    assert last_response.ok?
  end

  def test_set_params
    sample_params = {'somekey' => 'somevalue'}
    get '/set', params = sample_params
    assert last_response.ok?
    assert_equal last_response.body, "[\"somekey\", \"somevalue\"]"
  end

  def test_no_key_request
    get '/set'
    assert last_response.ok?
    assert_equal last_response.body, ""
  end


# ================ /get tests ===================

  def test_it_serves_get
    get '/get'
    assert last_response.ok?
  end

  def tests_a_blank_key
    get_value('')
    assert_equal last_response.body, ''
  end

  def test_a_single_request
    #tests when you submit an unknown key, it should return a blank string
    get_value('unknownkey')
    assert_equal last_response.body, ''
  end

  # ============= combined route tests ===================

  def test_feature_1
    # tests a situation in which a user submits a post request and then requests
    # that same key on the get url

    my_key = "key1"
    my_value = "value1"
    get "/set?#{my_key}=#{my_value}"

    get_value(my_key)
    assert_equal last_response.body, "#{my_value}"
  end

  def test_feature_2
    # submits two key value pairs and then tests that you can retrieve both

    submit_key_value("key1", "value1")
    submit_key_value("key2", "value2")

    get_value("key1")
    assert_equal last_response.body, "value1"

    get_value("key2")
    assert_equal last_response.body, "value2"
  end

  def test_feature_3
    #tests that a user can update a key-value pair

    submit_key_value("key1", "value1")
    submit_key_value("key1", "new value")

    get_value("key1")
    assert_equal last_response.body, "new value"
  end

  private

# ============= Test helper methods ==================

  def submit_key_value(key, value)
    get "/set?#{key}=#{value}"
  end

  def get_value(key)
    get "/get?key=#{key}"
  end
end
